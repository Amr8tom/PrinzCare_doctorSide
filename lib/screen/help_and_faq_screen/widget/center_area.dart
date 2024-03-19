import 'package:doctor_flutter/model/global/faq_cat.dart';
import 'package:doctor_flutter/screen/help_and_faq_screen/help_and_faq_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CenterArea extends StatelessWidget {
  final HelpAndFaqScreenController controller;

  const CenterArea({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount:
                controller.faqData?[controller.selectedCategory].faqs?.length,
            itemBuilder: (context, index) {
              Faqs? data =
                  controller.faqData?[controller.selectedCategory].faqs?[index];
              return Container(
                color: ColorRes.whiteSmoke,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data?.question ?? '',
                      style: const TextStyle(
                          fontSize: 15,
                          color: ColorRes.charcoalGrey,
                          fontFamily: FontRes.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      data?.answer ?? '',
                      style: const TextStyle(
                          fontSize: 15,
                          color: ColorRes.mediumGrey,
                          fontFamily: FontRes.light),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
