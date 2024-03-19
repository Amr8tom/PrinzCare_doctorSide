import 'dart:convert';

import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/countries/countries.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_one/doctor_profile_screen_one.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_three/doctor_profile_screeen_three.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/doctor_profile_screen_two/doctor_profile_screen_two.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/select_category_screen/select_category_screen.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/starting_profile_screen/widget/country_sheet.dart';
import 'package:doctor_flutter/screen/registration_successful_screen.dart/registration_successful_screen.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:doctor_flutter/service/pref_service.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class StartingProfileScreenController extends GetxController {
  List<Country> countries = [];
  List<Country> filterCountries = [];
  final genders = [S.current.male, S.current.feMale];
  Country? selectCountry;
  String selectGender = S.current.male;
  DoctorData? userData;
  PrefService prefService = PrefService();
  FocusNode nameFocusNode = FocusNode();

  PhoneNumber phoneNumber = PhoneNumber();
  TextEditingController countryController = TextEditingController();

  @override
  void onInit() {
    readJson();
    super.onInit();
  }

  void onGenderChange(String? value) {
    selectGender = value!;
    update([kSelectGender]);
  }

  Future<void> readJson() async {
    String response = await rootBundle.loadString(AssetRes.countryJson);
    countries = Countries.fromJson(json.decode(response)).country ?? [];
    filterCountries = Countries.fromJson(json.decode(response)).country ?? [];
    selectCountry = countries.first;
    prefData();
    update([kSelectCountries]);
  }

  void prefData() async {
    await prefService.init();
    userData = prefService.getRegistrationData();
    if (userData?.countryCode != null) {
      selectCountry = countries.firstWhere((element) {
        return element.countryCode == userData?.countryCode;
      });
    } else if (userData?.mobileNumber != null) {
      selectCountry = countries.firstWhere((element) {
        return element.phoneCode == userData?.mobileNumber?.split(' ')[0];
      });
    }
    selectGender = userData?.gender == 1 ? S.current.male : S.current.feMale;
    update();
  }

  void updateDoctorDetailsApiCall() {
    CustomUi.loader();
    ApiService.instance
        .updateDoctorDetails(
      countryCode: selectCountry?.countryCode ?? '',
      gender: selectGender == S.current.male ? 1 : 0,
      mobileNumber:
          '${phoneNumber.phoneNumber?.replaceAll(phoneNumber.dialCode.toString(), '')} ${phoneNumber.isoCode}',
    )
        .then((value) {
      if (value.status == true) {
        Get.back();
        navigateRoot(value.data!);
      } else {
        Get.back();
      }
    });
  }

  void navigateRoot(DoctorData data) {
    if (data.categoryId == null) {
      Get.off(() => const SelectCategoryScreen());
    } else if (data.image == null ||
        data.designation == null ||
        data.degrees == null ||
        data.experienceYear == null ||
        data.consultationFee == null) {
      Get.off(() => const DoctorProfileScreenOne());
    } else if (data.aboutYouself == null || data.educationalJourney == null) {
      Get.off(() => const DoctorProfileScreenTwo());
    } else if (data.onlineConsultation == 0 && data.clinicConsultation == 0) {
      Get.off(() => const DoctorProfileScreenThree());
    } else {
      Get.offAll(() => const RegistrationSuccessfulScreen());
    }
  }

  void countryBottomSheet(StartingProfileScreenController controller) {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.bottomSheet(
      GetBuilder(
        init: controller,
        builder: (controller) => CountrySheet(
            country: filterCountries,
            onCountryChange: onCountryChange,
            onCountryTap: onCountryTap,
            controller: countryController,
            screenController: controller),
      ),
      isScrollControlled: true,
    ).then((value) {
      countryController.clear();
      filterCountries = countries;
    });
  }

  void onCountryTap(Country value) {
    selectCountry = value;
    update();
    Get.back();
  }

  void onCountryChange(String value) {
    filterCountries = countries.where((element) {
      return (element.countryName ?? '')
          .isCaseInsensitiveContains(countryController.text);
    }).toList();
    update();
  }
}
