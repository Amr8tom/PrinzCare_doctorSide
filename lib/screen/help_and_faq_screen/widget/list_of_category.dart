import 'package:doctor_flutter/model/global/faq_cat.dart';
import 'package:doctor_flutter/screen/help_and_faq_screen/help_and_faq_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/style_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListOfCategory extends StatelessWidget {
  final HelpAndFaqScreenController controller;

  const ListOfCategory({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (c) {
        return Container(
          height: 45,
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.faqData?.length ?? 0,
            itemBuilder: (context, index) {
              FaqCatData? data = controller.faqData?[index];
              return InkWell(
                onTap: () {
                  controller.onCategoryChange(index);
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 1.5, vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: controller.selectedCategory == index
                        ? StyleRes.linearGradient
                        : StyleRes.linearGreyGradient,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    data?.title ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontRes.semiBold,
                      color: controller.selectedCategory == index
                          ? ColorRes.white
                          : ColorRes.starDust,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
