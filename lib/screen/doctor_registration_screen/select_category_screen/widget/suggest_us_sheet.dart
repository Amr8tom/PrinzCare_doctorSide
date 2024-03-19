import 'package:doctor_flutter/common/text_button_custom.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/select_category_screen/select_category_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuggestUsSheet extends StatelessWidget {
  final SelectCategoryScreenController controller;

  const SuggestUsSheet({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      decoration: const BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.current.suggestCategory,
                style: const TextStyle(
                    fontFamily: FontRes.extraBold, fontSize: 20),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: ColorRes.iceberg,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(
                    Icons.close_rounded,
                    color: ColorRes.charcoalGrey,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
          Text(
            S.current.enterTheCategoryEtc,
            style: const TextStyle(fontFamily: FontRes.light, fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: GetBuilder<SelectCategoryScreenController>(
                init: controller,
                builder: (context) => Column(
                  children: [
                    _textField(
                        controller: controller.titleController,
                        focusNode: controller.titleFocusNode),
                    const SizedBox(
                      height: 20,
                    ),
                    _textField(
                        expand: true,
                        controller: controller.aboutController,
                        focusNode: controller.aboutFocusNode),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SafeArea(
            top: false,
            child: TextButtonCustom(
                onPressed: controller.suggestDoctorCategoryApiCall,
                title: S.current.submit,
                titleColor: ColorRes.white,
                backgroundColor: ColorRes.darkSkyBlue),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _textField(
      {bool expand = false,
      required TextEditingController controller,
      required FocusNode focusNode}) {
    return Container(
      height: expand ? 200 : 50,
      decoration: BoxDecoration(
        color: ColorRes.whiteSmoke,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        expands: expand ? true : false,
        minLines: expand ? null : 1,
        maxLines: expand ? null : 1,
        textCapitalization: TextCapitalization.sentences,
        textAlignVertical:
            expand ? TextAlignVertical.top : TextAlignVertical.center,
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20, vertical: expand ? 15 : 0),
          border: InputBorder.none,
          hintText:
              expand ? S.current.explainUsAboutIt : S.current.enterCategoryName,
          hintStyle: const TextStyle(
              fontFamily: FontRes.semiBold, color: ColorRes.silverChalice),
        ),
        style: TextStyle(
          fontFamily: expand ? FontRes.medium : FontRes.semiBold,
          color: ColorRes.charcoalGrey,
          fontSize: 15,
        ),
        cursorHeight: 15,
        cursorColor: ColorRes.charcoalGrey,
      ),
    );
  }
}
