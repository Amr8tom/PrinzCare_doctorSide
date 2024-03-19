import 'package:doctor_flutter/utils/color_res.dart';
import 'package:flutter/material.dart';

class StyleRes {
  static const linearGradient = LinearGradient(
      colors: [ColorRes.crystalBlue, ColorRes.tuftsBlue100],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const linearGreyGradient = LinearGradient(
    colors: [
      ColorRes.whiteSmoke,
      ColorRes.whiteSmoke,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
