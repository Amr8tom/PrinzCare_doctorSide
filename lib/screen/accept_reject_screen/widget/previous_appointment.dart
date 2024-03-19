import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';

class PreviousAppointment extends StatelessWidget {
  final String title;
  final String description;
  final bool isDescription;
  final VoidCallback onTap;

  const PreviousAppointment(
      {Key? key,
      required this.title,
      required this.description,
      this.isDescription = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            color: ColorRes.snowDrift,
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            color: ColorRes.charcoalGrey,
                            fontFamily: FontRes.semiBold,
                            fontSize: 15),
                      ),
                      Visibility(
                        visible: isDescription,
                        child: Text(
                          description,
                          style: const TextStyle(
                              fontFamily: FontRes.regular,
                              fontSize: 12,
                              color: ColorRes.battleshipGrey),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 30,
                  color: ColorRes.tuftsBlue,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
