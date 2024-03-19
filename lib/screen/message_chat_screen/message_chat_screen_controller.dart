import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/common/fancy_button.dart';
import 'package:doctor_flutter/common/image_send_sheet.dart';
import 'package:doctor_flutter/common/video_upload_dialog.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/chat/chat.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/model/user/fetch_user_detail.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:doctor_flutter/service/pref_service.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/firebase_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class MessageChatScreenController extends GetxController {
  TextEditingController msgController = TextEditingController();
  TextEditingController sendMediaController = TextEditingController();
  ScrollController scrollController = ScrollController();
  Conversation conversation = Get.arguments;
  FirebaseFirestore db = FirebaseFirestore.instance;
  late DocumentReference documentSender;
  late DocumentReference documentReceiver;
  late CollectionReference drChatMessages;
  String firebaseUserIdentity = '';
  String firebaseDoctorIdentity = '';
  List<ChatMessage> chatData = [];
  String deletedId = '';
  ChatUser? receiverUser;
  ChatUser? senderUser;
  List<String> notDeletedIdentity = [];
  int startingNumber = 30;
  StreamSubscription<QuerySnapshot<ChatMessage>>? chatStream;
  PrefService prefService = PrefService();
  FocusNode msgFocusNode = FocusNode();
  bool isOpen = false;
  GlobalKey<FancyButtonState> key = GlobalKey<FancyButtonState>();
  ImagePicker picker = ImagePicker();
  String? imageUrl;
  String? videoUrl;
  DoctorData? doctorData;
  List<String> timeStamp = [];
  bool isLongPress = false;
  User? user;
  static String senderId = '';

  @override
  void onInit() {
    senderId = conversation.conversationId ?? '';
    fetchUserDetail();
    initFireBase();
    super.onInit();
  }

  void onSendBtnTap() {
    onTextFiledTap();
    if (msgController.text.isNotEmpty) {
      chatMessage(
          msgType: FirebaseRes.text, textMessage: msgController.text.trim());
      msgController.clear();
      update();
    }
  }

  void allScreenTap() {
    msgFocusNode.unfocus();
    onTextFiledTap();
  }

  void onTextFiledTap() {
    if (key.currentState?.isOpened == true) {
      key.currentState?.animate();
    }
  }

  void fetchUserDetail() {
    ApiService.instance
        .fetchUserDetails(userId: conversation.user?.userid ?? -1)
        .then((value) {
      user = value.data;
      update();
    });
  }

  void initFireBase() async {
    update();
    await prefService.init();
    doctorData = prefService.getRegistrationData();
    firebaseUserIdentity = '${conversation.user?.userid}';
    firebaseDoctorIdentity = '${doctorData?.id}';

    documentSender = db
        .collection(FirebaseRes.userChatList)
        .doc(firebaseDoctorIdentity)
        .collection(FirebaseRes.userList)
        .doc(firebaseUserIdentity);
    documentReceiver = db
        .collection(FirebaseRes.userChatList)
        .doc(firebaseUserIdentity)
        .collection(FirebaseRes.userList)
        .doc(firebaseDoctorIdentity);

    drChatMessages = db
        .collection(FirebaseRes.chat)
        .doc(conversation.conversationId)
        .collection(FirebaseRes.chat);
    getChat();
  }

  onScrollToFetchData() {
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        getChat();
      }
    });
  }

  void getChat() async {
    await documentSender
        .withConverter(
          fromFirestore: Conversation.fromFirestore,
          toFirestore: (Conversation value, options) {
            return value.toFirestore();
          },
        )
        .get()
        .then((value) {
      deletedId = value.data()?.deletedId.toString() ?? '';
    });

    chatStream = drChatMessages
        .where(FirebaseRes.noDeleteIdentity,
            arrayContains: firebaseDoctorIdentity)
        .where(FirebaseRes.id,
            isGreaterThan: deletedId.isEmpty ? '0' : deletedId)
        .orderBy(FirebaseRes.id, descending: true)
        .limit(startingNumber)
        .withConverter(
          fromFirestore: ChatMessage.fromFirestore,
          toFirestore: (ChatMessage value, options) {
            return value.toFirestore();
          },
        )
        .snapshots()
        .listen(
      (element) async {
        chatData = [];
        for (int i = 0; i < element.docs.length; i++) {
          chatData.add(element.docs[i].data());
        }
        startingNumber += 45;
        update();
      },
    );
  }

  ///Firebase message update method
  Future<void> chatMessage(
      {required String msgType,
      String? textMessage,
      String? image,
      String? video}) async {
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    notDeletedIdentity = [];
    notDeletedIdentity.addAll(
      [firebaseUserIdentity, firebaseDoctorIdentity],
    );
    drChatMessages.doc(time).set(
          ChatMessage(
            notDeletedIdentities: notDeletedIdentity,
            senderUser: ChatUser(
              username: doctorData?.name,
              msgCount: 0,
              userid: doctorData?.id,
              userIdentity: doctorData?.identity,
              image: doctorData?.image,
              gender:
                  doctorData?.gender == 0 ? S.current.feMale : S.current.male,
              designation: doctorData?.designation,
            ),
            msgType: msgType,
            msg: textMessage,
            image: image,
            video: video,
            id: time,
          ).toJson(),
        );

    await documentReceiver
        .withConverter(
          fromFirestore: Conversation.fromFirestore,
          toFirestore: (value, options) => value.toFirestore(),
        )
        .get()
        .then((value) {
      receiverUser = value.data()?.user;
      receiverUser?.msgCount = (receiverUser?.msgCount ?? 0) + 1;
      documentReceiver.update({
        FirebaseRes.time: time,
        FirebaseRes.lastMsg: msgType == FirebaseRes.image
            ? '🖼️ ${FirebaseRes.image}'
            : msgType == FirebaseRes.video
                ? '🎥 ${FirebaseRes.video}'
                : textMessage,
        FirebaseRes.user: receiverUser?.toJson(),
      });

    });
    await documentSender.update(
      {
        FirebaseRes.time: time,
        FirebaseRes.lastMsg: msgType == FirebaseRes.image
            ? '🖼️ ${FirebaseRes.image}'
            : msgType == FirebaseRes.video
                ? '🎥 ${FirebaseRes.video}'
                : textMessage,
      },
    );

    if (user?.isNotification == 1) {
      ApiService().pushNotification(
          title: doctorData?.name ?? S.current.unKnown,
          body: msgType == FirebaseRes.image
              ? '🖼️ ${FirebaseRes.image}'
              : msgType == FirebaseRes.video
                  ? '🎥 ${FirebaseRes.video}'
                  : '$textMessage',
          token: '${user?.deviceToken}',
          senderIdentity: conversation.conversationId,
          type: '0');
    }
  }

  void onImageTap({required ImageSource source}) async {
    key.currentState?.animate();
    final XFile? galleryImage = await picker.pickImage(
        source: source,
        imageQuality: ConstRes.imageQuality,
        maxHeight: ConstRes.maxHeight,
        maxWidth: ConstRes.maxWidth);
    if (galleryImage != null) {
      ApiService.instance
          .uploadFileGivePath(File(galleryImage.path))
          .then((value) {
        imageUrl = value.path;
      });
      Get.bottomSheet(
              ImageSendSheet(
                image: galleryImage.path,
                onSendMediaTap: (image) =>
                    onSendMediaTap(image: galleryImage.path, type: 0),
                sendMediaController: sendMediaController,
              ),
              isScrollControlled: true)
          .then((value) {
        sendMediaController.clear();
      });
    }
  }

  void onVideoTap() async {
    key.currentState?.animate();
    final XFile? video = await picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      /// calculating file size
      final videoFile = File(video.path);
      int sizeInBytes = videoFile.lengthSync();
      double sizeInMb = sizeInBytes / (1024 * 1024);
      if (sizeInMb <= 15) {
        CustomUi.loader();
        ApiService.instance.uploadFileGivePath(File(video.path)).then((value) {
          videoUrl = value.path;
        });
        VideoThumbnail.thumbnailFile(video: video.path).then((value) {
          ApiService.instance
              .uploadFileGivePath(File(value ?? ''))
              .then((value) {
            imageUrl = value.path;
          });
          Get.back();
          Get.bottomSheet(
                  ImageSendSheet(
                    image: value ?? '',
                    onSendMediaTap: (String image) => onSendMediaTap(
                        image: value ?? '', type: 1, video: videoFile.path),
                    sendMediaController: sendMediaController,
                  ),
                  isScrollControlled: true)
              .then((value) {
            sendMediaController.clear();
          });
        });
      } else {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return VideoUploadDialog(selectAnother: () {
              Get.back();
              onVideoTap();
            });
          },
        );
      }
    }
  }

  void onSendMediaTap(
      {required String image, required int type, String? video}) async {
    if (type == 0) {
      if (imageUrl == null) {
        await ApiService.instance.uploadFileGivePath(File(image)).then((value) {
          imageUrl = value.path;
        });
      }
      Get.back();
      chatMessage(
          msgType: FirebaseRes.image,
          textMessage: sendMediaController.text.trim(),
          image: imageUrl);
    } else {
      if (videoUrl == null) {
        await ApiService.instance
            .uploadFileGivePath(File(video ?? ''))
            .then((value) {
          videoUrl = value.path;
        });
      } else if (imageUrl == null) {
        await ApiService.instance.uploadFileGivePath(File(image)).then((value) {
          imageUrl = value.path;
        });
      }
      Get.back();
      chatMessage(
        msgType: FirebaseRes.video,
        textMessage: sendMediaController.text.trim(),
        image: imageUrl,
        video: videoUrl,
      );
    }
  }

  @override
  void onClose() async {
    log('message : : ');
    senderId = '';
    await chatStream?.cancel();
    await documentSender
        .withConverter(
          fromFirestore: Conversation.fromFirestore,
          toFirestore: (value, options) => value.toFirestore(),
        )
        .get()
        .then((value) {
      senderUser = value.data()?.user;
      senderUser?.msgCount = 0;
      documentSender.update({FirebaseRes.user: senderUser?.toJson()});
    });
    super.onClose();
  }

  /// long press to select chat method
  void onLongPress(ChatMessage? data) {
    if (!timeStamp.contains('${data?.id}')) {
      timeStamp.add('${data?.id}');
    } else {
      timeStamp.remove('${data?.id}');
    }
    isLongPress = true;
    update();
  }

  void onMsgDeleteBackTap() {
    timeStamp = [];
    update();
  }

  void onChatItemDelete() {
    for (int i = 0; i < timeStamp.length; i++) {
      drChatMessages.doc(timeStamp[i]).update(
        {
          FirebaseRes.noDeleteIdentity: FieldValue.arrayRemove(
            [firebaseDoctorIdentity],
          )
        },
      );
      chatData.removeWhere(
        (element) => element.id.toString() == timeStamp[i],
      );
    }
    timeStamp = [];
    Get.back();
    update();
  }
}
