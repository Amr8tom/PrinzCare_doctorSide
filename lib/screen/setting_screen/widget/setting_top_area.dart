import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/style_res.dart';
import 'package:flutter/material.dart';

class SettingTopArea extends StatelessWidget {
  final String title;
  final String title2;
  final AlignmentGeometry alignment;
  final bool enable;
  final VoidCallback onTap;

  const SettingTopArea(
      {Key? key,
      required this.title,
      required this.title2,
      required this.alignment,
      required this.enable,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.whiteSmoke,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontFamily: FontRes.medium,
                      fontSize: 15,
                      color: ColorRes.charcoalGrey),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title2,
                  style: const TextStyle(
                      fontSize: 12.5, color: ColorRes.mediumGrey),
                )
              ],
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: onTap,
            child: AnimatedContainer(
              height: 25,
              width: 40,
              padding: const EdgeInsets.symmetric(horizontal: 3.5),
              alignment: alignment,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: enable
                    ? StyleRes.linearGradient
                    : const LinearGradient(
                        colors: [ColorRes.grey, ColorRes.grey],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
              ),
              duration: const Duration(milliseconds: 250),
              child: Container(
                height: 19,
                width: 19,
                decoration: const BoxDecoration(
                  color: ColorRes.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
