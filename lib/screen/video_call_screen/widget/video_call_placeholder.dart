import 'dart:ui';

import 'package:doctor_flutter/screen/video_call_screen/video_call_screen.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';

class LocalPlaceHolder extends StatelessWidget {
  final String image;
  final String name;

  const LocalPlaceHolder({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      '${ConstRes.itemBaseURL}$image',
      width: 100,
      height: 100,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: ColorRes.grey,
          alignment: Alignment.center,
          child: Text(
            name,
            style: const TextStyle(
                color: ColorRes.white, fontSize: 70, fontFamily: FontRes.black),
          ),
        );
      },
    );
  }
}

class RemotePlaceHolder extends StatelessWidget {
  final String image;
  final String name;
  final Widget widget;

  const RemotePlaceHolder(
      {super.key,
      required this.image,
      required this.name,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Image.network(
            '${ConstRes.itemBaseURL}$image',
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return BlurImageTextCard(name: name);
            },
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorRes.black.withOpacity(0.5),
        ),
        widget
      ],
    );
  }
}
