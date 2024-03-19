import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/appointment_screen/appointment_screen.dart';
import 'package:doctor_flutter/screen/dashboard_screen/dashboard_screen_controller.dart';
import 'package:doctor_flutter/screen/dashboard_screen/widget/custom_animated_bottom_bar.dart';
import 'package:doctor_flutter/screen/message_screen/message_screen.dart';
import 'package:doctor_flutter/screen/notification_screen/notification_screen.dart';
import 'package:doctor_flutter/screen/profile_screen/profile_screen.dart';
import 'package:doctor_flutter/screen/request_screen/request_screen.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../payment_screen/payment_Screen.dart';

const bottomSheetStyle = TextStyle(fontSize: 12);

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardScreenController());
    return GetBuilder(
      init: controller,
      builder: (context) {
        return Scaffold(
          backgroundColor: ColorRes.white,
          bottomNavigationBar: _buildBottomBar(controller),
          body: controller.currentIndex == 0
              ? const AppointmentScreen()
              // ? const paymentScreen()
              : controller.currentIndex == 1
                  ? const RequestScreen()
                  : controller.currentIndex == 2
                      ? const MessageScreen()
                      : controller.currentIndex == 3
                          ? const NotificationScreen()
                          : const ProfileScreen(),
        );
      },
    );
  }

  Widget _buildBottomBar(DashboardScreenController controller) {
    return CustomAnimatedBottomBar(
      containerHeight: 60,
      selectedIndex: controller.currentIndex,
      showElevation: true,
      curve: Curves.easeIn,
      onItemSelected: controller.onItemSelected,
      items: [
        BottomNavyBarItem(
          image: Icon(
            Icons.done,
            size: 28,
            color: controller.currentIndex == 0
                ? ColorRes.white
                : ColorRes.starDust,
          ),
          title: Text(
            S.current.appointments,
            style: bottomSheetStyle,
          ),
        ),
        BottomNavyBarItem(
          image: Icon(
            Icons.access_time_filled,
            size: 28,
            color: controller.currentIndex == 1
                ? ColorRes.white
                : ColorRes.starDust,
          ),
          title: Text(S.current.requests, style: bottomSheetStyle),
        ),
        BottomNavyBarItem(
          image: Image.asset(
            AssetRes.chatQuote,
            width: 22,
            color: controller.currentIndex == 2
                ? ColorRes.white
                : ColorRes.starDust,
          ),
          title: Text(S.current.message, style: bottomSheetStyle),
        ),
        BottomNavyBarItem(
          image: Icon(
            Icons.notification_add,
            color: controller.currentIndex == 3
                ? ColorRes.white
                : ColorRes.starDust,
          ),
          title: Text(S.current.notifications, style: bottomSheetStyle),
        ),
        BottomNavyBarItem(
          image: Icon(
            Icons.person_pin_outlined,
            size: 28,
            color: controller.currentIndex == 4
                ? ColorRes.white
                : ColorRes.starDust,
          ),
          title: Text(S.current.profile, style: bottomSheetStyle),
        ),
      ],
    );
  }
}
