import 'package:doctor_flutter/common/text_button_custom.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetOneTextField extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final TextEditingController controller;

  const BottomSheetOneTextField(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: FontRes.extraBold,
                      color: ColorRes.charcoalGrey,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 37,
                      width: 37,
                      decoration: const BoxDecoration(
                          color: ColorRes.iceberg, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.close_rounded,
                        color: ColorRes.darkSkyBlue,
                        size: 22,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                    color: ColorRes.silverChalice.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: S.current.enterHere,
                    hintStyle: const TextStyle(
                        color: ColorRes.silverChalice,
                        fontFamily: FontRes.semiBold,
                        fontSize: 15),
                  ),
                  cursorColor: ColorRes.charcoalGrey,
                  cursorHeight: 15,
                  style: const TextStyle(
                      fontFamily: FontRes.semiBold,
                      fontSize: 15,
                      color: ColorRes.battleshipGrey),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButtonCustom(
                  onPressed: onTap,
                  title: S.current.continueText,
                  titleColor: ColorRes.white,
                  backgroundColor: ColorRes.darkSkyBlue),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
