import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSelectedItemBar extends StatelessWidget {
  final VoidCallback onBackTap;
  final int selectedItemCount;
  final VoidCallback onItemDelete;

  const BottomSelectedItemBar(
      {Key? key,
      required this.onBackTap,
      required this.selectedItemCount,
      required this.onItemDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      width: Get.width,
      decoration: const BoxDecoration(color: ColorRes.whiteSmoke),
      child: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Directionality.of(context) == TextDirection.rtl
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: InkWell(
                onTap: onBackTap,
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: ColorRes.charcoalGrey,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Text(
                    '$selectedItemCount\t\t',
                    key: ValueKey<int>(selectedItemCount),
                    style: const TextStyle(
                      fontFamily: FontRes.semiBold,
                      fontSize: 15,
                      color: ColorRes.grey,
                    ),
                  ),
                ),
                Text(
                  S.current.selectMsg,
                  style: const TextStyle(
                      fontSize: 15,
                      color: ColorRes.grey,
                      fontFamily: FontRes.semiBold),
                ),
              ],
            ),
            Align(
              alignment: Directionality.of(context) == TextDirection.rtl
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: InkWell(
                onTap: onItemDelete,
                child: const Icon(
                  Icons.delete,
                  color: ColorRes.havelockBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
