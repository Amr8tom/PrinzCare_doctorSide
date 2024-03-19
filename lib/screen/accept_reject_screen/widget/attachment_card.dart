import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/appointment/appointment_request.dart';
import 'package:doctor_flutter/screen/image_preview_screen/image_preview_screen.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttachmentCard extends StatelessWidget {
  final List<Documents>? doc;

  const AttachmentCard({Key? key, this.doc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return doc == null || doc!.isEmpty
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: Text(
                  S.current.attachments,
                  style: const TextStyle(
                      color: ColorRes.battleshipGrey, fontSize: 15),
                ),
              ),
              Container(
                height: 105,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  itemCount: doc?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.dialog(ImagePreviewScreen(
                            imageUrl: '${doc?[index].image}'));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${ConstRes.itemBaseURL}${doc?[index].image}',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              return Container();
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
