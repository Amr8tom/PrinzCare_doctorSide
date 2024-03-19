import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';

class SettingsFiledTopBar extends StatelessWidget {
  final String title1;
  final String title2;

  const SettingsFiledTopBar(
      {Key? key, required this.title1, required this.title2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title1,
            style: const TextStyle(
                fontFamily: FontRes.semiBold,
                color: ColorRes.charcoalGrey,
                fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title2,
            style: const TextStyle(color: ColorRes.mediumGrey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
