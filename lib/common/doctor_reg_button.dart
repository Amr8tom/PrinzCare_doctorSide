import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';

class DoctorRegButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const DoctorRegButton({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: ColorRes.darkSkyBlue,
        child: SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                color: ColorRes.white,
                fontFamily: FontRes.semiBold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
