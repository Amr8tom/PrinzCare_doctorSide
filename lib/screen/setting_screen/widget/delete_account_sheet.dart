import 'package:doctor_flutter/common/text_button_custom.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountSheet extends StatelessWidget {
  final VoidCallback onDeleteContinueTap;
  final String title;
  final String description;

  const DeleteAccountSheet(
      {Key? key,
      required this.onDeleteContinueTap,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: ColorRes.charcoalGrey,
                          fontSize: 20,
                          fontFamily: FontRes.extraBold),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 37,
                      width: 37,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorRes.havelockBlue.withOpacity(0.1)),
                      child: const Icon(
                        Icons.close_rounded,
                        color: ColorRes.charcoalGrey,
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                description,
                style: const TextStyle(
                    fontFamily: FontRes.light,
                    fontSize: 16,
                    color: ColorRes.davyGrey),
              ),
              const SizedBox(
                height: 50,
              ),
              SafeArea(
                top: false,
                child: TextButtonCustom(
                  onPressed: onDeleteContinueTap,
                  title: S.current.continueText,
                  titleColor: ColorRes.white,
                  backgroundColor: ColorRes.darkSkyBlue,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
