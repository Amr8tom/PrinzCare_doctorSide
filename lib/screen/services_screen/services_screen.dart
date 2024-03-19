import 'package:doctor_flutter/common/list_tile_with_more_button.dart';
import 'package:doctor_flutter/common/settings_filed_top_bar.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/services_screen/services_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesScreen extends StatelessWidget {
  final int type;
  const ServicesScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServicesScreenController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBarArea(
            title: type == 0
                ? S.current.services
                : type == 1
                    ? S.current.expertise
                    : type == 2
                        ? S.current.experience
                        : S.current.awards,
          ),
          SettingsFiledTopBar(
              title1:
                  '${S.current.manage} ${type == 0 ? S.current.services : type == 1 ? S.current.expertise : type == 2 ? S.current.experience : S.current.awards}'
                      .toUpperCase(),
              title2: type == 0
                  ? S.current.exampleHypertensionEtc
                  : type == 1
                      ? S.current.exampleAllergistsEtc
                      : type == 2
                          ? S.current.exampleAllergistsEtc
                          : S.current.exampleAwardEtc),
          GetBuilder(
            init: controller,
            builder: (context) {
              return controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListTileWithMoreButton(
                      data: type == 0
                          ? controller.registrationData?.services
                          : type == 1
                              ? controller.registrationData?.expertise
                              : type == 2
                                  ? controller.registrationData?.experience
                                  : controller.registrationData?.awards,
                      controller: controller,
                      screenType: type,
                      noData: type == 0
                          ? '${S.current.no} ${S.current.services} ${S.current.available}'
                          : type == 1
                              ? '${S.current.no} ${S.current.expertise} ${S.current.available}'
                              : type == 2
                                  ? '${S.current.no}  ${S.current.experience}'
                                  : '${S.current.no}  ${S.current.awards}');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.onServiceSheetOpen(
            screenType: type, apiType: 1, isAdd: true),
        backgroundColor: ColorRes.tuftsBlue,
        child: const Icon(
          Icons.add_rounded,
          color: ColorRes.white,
          size: 30,
        ),
      ),
    );
  }
}
