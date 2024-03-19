import 'package:doctor_flutter/screen/profile_screen/profile_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';

class ListOfCategory extends StatelessWidget {
  final ProfileScreenController controller;

  const ListOfCategory({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.list.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => controller.onCategoryChange(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 1.5, vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: controller.selectedCategory == index
                    ? ColorRes.tuftsBlue
                    : ColorRes.whiteSmoke,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                controller.list[index],
                style: TextStyle(
                  color: controller.selectedCategory == index
                      ? ColorRes.white
                      : ColorRes.starDust,
                  fontFamily: FontRes.semiBold,
                  fontSize: 15,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
