import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';

class ListTiles extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color textColor;
  final Color iconColor;

  const ListTiles(
      {Key? key,
      required this.onTap,
      required this.title,
      this.textColor = ColorRes.charcoalGrey,
      this.iconColor = ColorRes.tuftsBlue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            color: ColorRes.whiteSmoke,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: FontRes.medium,
                      color: textColor,
                      fontSize: 15),
                ),
                const Spacer(),
                Icon(
                  Icons.chevron_right_rounded,
                  size: 25,
                  color: iconColor,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}
