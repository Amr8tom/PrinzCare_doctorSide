// ignore_for_file: use_key_in_widget_constructors

import 'package:doctor_flutter/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScreen extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerScreen.rectangular(
      {this.width = double.infinity,
      required this.height,
      required this.shapeBorder});

  const ShimmerScreen.circular(
      {this.width = double.infinity,
      required this.height,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorRes.mercury,
      highlightColor: ColorRes.blueLagoon,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: ColorRes.mercury,
          shape: shapeBorder,
        ),
      ),
    );
  }
}
