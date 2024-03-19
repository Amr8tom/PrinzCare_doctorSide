import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/help_and_faq_screen/help_and_faq_screen_controller.dart';
import 'package:doctor_flutter/screen/help_and_faq_screen/widget/center_area.dart';
import 'package:doctor_flutter/screen/help_and_faq_screen/widget/list_of_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpAndFaqScreen extends StatelessWidget {
  const HelpAndFaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HelpAndFaqScreenController());
    return Scaffold(
      body: Column(
        children: [
          TopBarArea(title: S.current.helpAndFAQs),
          ListOfCategory(controller: controller),
          CenterArea(controller: controller),
        ],
      ),
    );
  }
}
