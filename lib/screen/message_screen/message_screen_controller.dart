import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/chat/chat.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/message_chat_screen/widget/message_chat_top_bar.dart';
import 'package:doctor_flutter/service/pref_service.dart';
import 'package:doctor_flutter/utils/firebase_res.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MessageScreenController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<Conversation?> userList = [];
  bool isLoading = false;
  StreamSubscription<QuerySnapshot<Conversation>>? subscription;
  PrefService prefService = PrefService();
  DoctorData? doctorData;
  String firebaseDoctorIdentity = '';

  @override
  void onInit() {
    getChatUsers();
    super.onInit();
  }

  void getChatUsers() async {
    await prefService.init();
    doctorData = prefService.getRegistrationData();
    firebaseDoctorIdentity = '${doctorData?.id}';
    isLoading = true;
    subscription = db
        .collection(FirebaseRes.userChatList)
        .doc(firebaseDoctorIdentity)
        .collection(FirebaseRes.userList)
        .orderBy(FirebaseRes.time, descending: true)
        .where(FirebaseRes.isDeleted, isEqualTo: false)
        .withConverter(
            fromFirestore: Conversation.fromFirestore,
            toFirestore: (Conversation value, options) => value.toFirestore())
        .snapshots()
        .listen((element) {
      userList = [];
      for (int i = 0; i < element.docs.length; i++) {
        userList.add(element.docs[i].data());
      }
      isLoading = false;
      update();
    });
  }

  void onLongPress(Conversation? conversation) {
    HapticFeedback.vibrate();
    Get.dialog(
      ConfirmationDialog(
        aspectRatio: 1 / 0.6,
        positiveText: S.current.deleteChat,
        title: S.current.messageWillOnlyBeRemovedEtc,
        onPositiveBtn: () {
          db
              .collection(FirebaseRes.userChatList)
              .doc(firebaseDoctorIdentity)
              .collection(FirebaseRes.userList)
              .doc('${conversation?.user?.userid}')
              .update({
            FirebaseRes.isDeleted: true,
            FirebaseRes.deletedId: '${DateTime.now().millisecondsSinceEpoch}',
          }).then((value) {
            Get.back();
          });
        },
      ),
    );
    update();
  }

  @override
  void onClose() {
    subscription?.cancel();
    super.onClose();
  }
}
