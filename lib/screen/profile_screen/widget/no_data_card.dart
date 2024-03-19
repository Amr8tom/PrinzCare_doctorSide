import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';

class NoDataCard extends StatelessWidget {
  final String title;
  final String example;
  final VoidCallback onTap;

  const NoDataCard(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.example})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: S.current.thereIsNothingToShow,
                style: const TextStyle(
                    color: ColorRes.davyGrey,
                    fontSize: 15,
                    fontFamily: FontRes.regular),
                children: [
                  TextSpan(
                    text: S.current.pleaseAddSome,
                    style: const TextStyle(
                        color: ColorRes.davyGrey,
                        fontSize: 15,
                        fontFamily: FontRes.regular),
                  ),
                  TextSpan(
                    text: title,
                    style: const TextStyle(
                        color: ColorRes.davyGrey,
                        fontSize: 15,
                        fontFamily: FontRes.regular),
                  ),
                  TextSpan(
                    text: S.current.toYourProfile,
                    style: const TextStyle(
                        color: ColorRes.davyGrey,
                        fontSize: 15,
                        fontFamily: FontRes.regular),
                  ),
                ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            example,
            style: const TextStyle(color: ColorRes.nobel, fontSize: 14),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: ColorRes.softPeach,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                '${S.current.add} $title',
                style: const TextStyle(
                    color: ColorRes.tuftsBlue,
                    fontSize: 15,
                    fontFamily: FontRes.semiBold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
