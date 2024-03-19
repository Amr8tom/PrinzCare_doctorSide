import 'package:doctor_flutter/common/common_fun.dart';
import 'package:doctor_flutter/common/list_tiles.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/add_bank_detail_screen/add_bank_detail_screen.dart';
import 'package:doctor_flutter/screen/appointment_history_screen/appointment_history_screen.dart';
import 'package:doctor_flutter/screen/appointment_slots_screen/appointment_slots_screen.dart';
import 'package:doctor_flutter/screen/earning_report_screen/earning_report_screen.dart';
import 'package:doctor_flutter/screen/help_and_faq_screen/help_and_faq_screen.dart';
import 'package:doctor_flutter/screen/languages_screen/languages_screen.dart';
import 'package:doctor_flutter/screen/manage_holiday_screen/manage_holiday_screen.dart';
import 'package:doctor_flutter/screen/payouts_history_screen/payouts_history_screen.dart';
import 'package:doctor_flutter/screen/profile_detail_screen/profile_detail_screen.dart';
import 'package:doctor_flutter/screen/setting_screen/setting_screen_controller.dart';
import 'package:doctor_flutter/screen/setting_screen/widget/setting_top_area.dart';
import 'package:doctor_flutter/screen/wallet_screen/wallet_screen.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingScreenController());
    return Scaffold(
      body: GetBuilder(
          init: controller,
          builder: (context) {
            return Column(
              children: [
                TopBarArea(title: S.current.settings),
                Expanded(
                  child: SingleChildScrollView(
                    child: SafeArea(
                      top: false,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 2,
                          ),
                          GetBuilder<SettingScreenController>(
                            id: kNotification,
                            init: controller,
                            builder: (controller) => SettingTopArea(
                                title: S.current.pushNotification,
                                title2: S.current.keepItOnIfYouWantEtc,
                                alignment: controller.isNotification
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                enable: controller.isNotification,
                                onTap: controller.onPushNotificationTap),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          GetBuilder<SettingScreenController>(
                            id: kNotification,
                            init: controller,
                            builder: (controller) => SettingTopArea(
                              title: S.current.vacationMode,
                              title2: S.current.keepingItOffYourProfileEtc,
                              alignment: controller.isVacationMode
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              enable: controller.isVacationMode,
                              onTap: controller.onVacationModeTap,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTiles(
                            title: S.current.editProfileDetails,
                            onTap: () {
                              CommonFun.doctorBanned(() {
                                Get.to(() => const ProfileDetailScreen());
                              });
                            },
                          ),
                          ListTiles(
                            title: S.current.appointmentHistory,
                            onTap: () {
                              CommonFun.doctorBanned(() {
                                Get.to(() => const AppointmentHistoryScreen());
                              });
                            },
                          ),
                          ListTiles(
                            title: S.current.appointmentSlots,
                            onTap: () {
                              CommonFun.doctorBanned(() {
                                Get.to(() => const AppointmentSlotsScreen());
                              });
                            },
                          ),
                          ListTiles(
                            title: S.current.manageHolidays,
                            onTap: () {
                              CommonFun.doctorBanned(() {
                                Get.to(() => const ManageHolidayScreen());
                              });
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ListTiles(
                            title: S.current.wallet,
                            onTap: () {
                              CommonFun.doctorBanned(() {
                                Get.to(() => const WalletScreen());
                              });
                            },
                          ),
                          ListTiles(
                            title: S.current.earningReport,
                            onTap: () {
                              CommonFun.doctorBanned(() {
                                Get.to(() => const EarningReportScreen());
                              });
                            },
                          ),
                          ListTiles(
                            title: S.current.payouts,
                            onTap: () {
                              CommonFun.doctorBanned(() {
                                Get.to(() => const PayoutHistoryScreen());
                              });
                            },
                          ),
                          ListTiles(
                            title: S.current.bankDetails,
                            onTap: () {
                              CommonFun.doctorBanned(() {
                                Get.to(() => const AddBankDetailScreen());
                              });
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ListTiles(
                            title: S.current.languages,
                            onTap: () {
                              CommonFun.doctorBanned(() {
                                Get.to(() => const LanguagesScreen());
                              });
                            },
                          ),
                          ListTiles(
                            title: S.current.termsOfUse,
                            onTap: () {
                              CommonFun.doctorBanned(() async {
                                if (!await launchUrl(
                                    Uri.parse(ConstRes.termsOfUser))) {
                                  throw Exception('Could not launch ');
                                }
                              });
                            },
                          ),
                          ListTiles(
                            title: S.current.privacyPolicy,
                            onTap: () {
                              CommonFun.doctorBanned(() async {
                                if (!await launchUrl(
                                    Uri.parse(ConstRes.privacyPolicy))) {
                                  throw Exception('Could not launch ');
                                }
                              });
                            },
                          ),
                          ListTiles(
                            title: S.current.helpAndFAQs,
                            onTap: () {
                              CommonFun.doctorBanned(() {
                                Get.to(() => const HelpAndFaqScreen());
                              });
                            },
                          ),
                          ListTiles(
                            title: S.current.logout,
                            onTap: controller.onLogoutTap,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ListTiles(
                            title: S.current.deleteMyAccount,
                            onTap: controller.deleteMyAccountTap,
                            textColor: ColorRes.bittersweet,
                            iconColor: ColorRes.bittersweet,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
