import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/model/global/global_setting.dart';
import 'package:doctor_flutter/service/pref_service.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationSuccessfulScreen extends StatefulWidget {
  const RegistrationSuccessfulScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationSuccessfulScreen> createState() =>
      _RegistrationSuccessfulScreenState();
}

class _RegistrationSuccessfulScreenState
    extends State<RegistrationSuccessfulScreen> {
  PrefService prefService = PrefService();
  DoctorData? data;
  GlobalSettingData? settings;

  @override
  void initState() {
    prefData();
    super.initState();
  }

  void prefData() async {
    await prefService.init();
    data = prefService.getRegistrationData();
    settings = prefService.getSettingData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () async {
          if (data?.status == 0) {
            CustomUi.snackBar(
                message: S.current.yourProfileIsPending,
                iconData: Icons.person);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height / 2.4,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              color: ColorRes.havelockBlue.withOpacity(0.1),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Image.asset(
                      AssetRes.iconParkSolidCorrect,
                      width: 70,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        text: S.current.doctor,
                        style: const TextStyle(
                            color: ColorRes.havelockBlue,
                            fontSize: 24,
                            fontFamily: FontRes.extraBold),
                        children: [
                          TextSpan(
                            text: " ${S.current.registration}",
                            style: const TextStyle(
                                color: ColorRes.havelockBlue,
                                fontFamily: FontRes.medium),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      S.current.submissionSuccessful,
                      style: const TextStyle(
                          color: ColorRes.davyGrey,
                          fontFamily: FontRes.medium,
                          fontSize: 17),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${S.current.requestId}${data?.doctorNumber ?? ''}',
                      style: const TextStyle(
                        color: ColorRes.davyGrey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    S.current.allOfTheDetailsEtc,
                    style: const TextStyle(color: ColorRes.grey, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    S.current.itWillTakeAroundEtc,
                    style: const TextStyle(color: ColorRes.grey, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    S.current.writeUsOnBelowEtc,
                    style: const TextStyle(color: ColorRes.grey, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    settings?.supportEmail ?? '',
                    style: const TextStyle(
                        color: ColorRes.charcoalGrey,
                        fontSize: 16,
                        fontFamily: FontRes.semiBold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
