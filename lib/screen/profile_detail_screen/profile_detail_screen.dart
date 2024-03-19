import 'package:doctor_flutter/common/list_tiles.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_three/doctor_profile_screeen_three.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_two/doctor_profile_screen_two.dart';
import 'package:doctor_flutter/screen/personal_information_screen/personal_information_screen.dart';
import 'package:doctor_flutter/screen/profile_detail_screen/profile_detail_screen_controller.dart';
import 'package:doctor_flutter/screen/service_location_screen/service_location_screen.dart';
import 'package:doctor_flutter/screen/services_screen/services_screen.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileDetailScreenController());
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Column(
        children: [
          TopBarArea(title: S.current.profileDetails),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTiles(
                      onTap: () {
                        Get.to(() => const PersonalInformationScreen());
                      },
                      title: S.current.personalInformation),
                  ListTiles(
                      onTap: () {
                        Get.to(() => const DoctorProfileScreenTwo(),
                            arguments: S.current.aboutYourselfEducation);
                      },
                      title: S.current.aboutYourselfEducation),
                  ListTiles(
                      onTap: () {
                        Get.to(() => const DoctorProfileScreenThree(),
                            arguments: S.current.consultationType);
                      },
                      title: S.current.consultationType),
                  ListTiles(
                      onTap: () {
                        Get.to(() => const ServicesScreen(type: 0));
                      },
                      title: S.current.services),
                  ListTiles(
                      onTap: () {
                        Get.to(() => const ServicesScreen(type: 1));
                      },
                      title: S.current.expertise),
                  ListTiles(
                      onTap: () {
                        Get.to(
                          () => const ServicesScreen(type: 2),
                        );
                      },
                      title: S.current.experience),
                  ListTiles(
                      onTap: () {
                        Get.to(
                          () => const ServicesScreen(type: 3),
                        );
                      },
                      title: S.current.awards),
                  ListTiles(
                      onTap: () {
                        Get.to(() => const ServiceLocationScreen());
                      },
                      title: S.current.serviceLocations),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
