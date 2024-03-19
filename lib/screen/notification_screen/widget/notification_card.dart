import 'package:doctor_flutter/model/notification/notification.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final NotificationData? data;

  const NotificationCard({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data?.title ?? '',
            style: const TextStyle(
                fontFamily: FontRes.medium,
                fontSize: 15,
                color: ColorRes.darkJungleGreen),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            data?.description ?? '',
            style: const TextStyle(
                fontFamily: FontRes.light,
                fontSize: 13,
                color: ColorRes.davyGrey),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider()
        ],
      ),
    );
  }
}
