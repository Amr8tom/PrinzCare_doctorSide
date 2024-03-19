import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';

class ProblemCard extends StatelessWidget {
  final String title;
  final String description;

  const ProblemCard({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            title,
            style:
                const TextStyle(color: ColorRes.battleshipGrey, fontSize: 15),
          ),
        ),
        Container(
          color: ColorRes.snowDrift,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Text(
            description,
            style: const TextStyle(
                color: ColorRes.mediumGrey,
                fontSize: 15,
                fontFamily: FontRes.medium),
          ),
        ),
      ],
    );
  }
}
