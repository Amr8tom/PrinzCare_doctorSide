import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/model/review/review.dart';
import 'package:doctor_flutter/screen/service_location_screen/service_location_screen.dart';
import 'package:doctor_flutter/screen/services_screen/services_screen.dart';
import 'package:doctor_flutter/screen/setting_screen/setting_screen.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  List<String> list = [
    S.current.details,
    S.current.experience,
    S.current.education,
    S.current.reviews,
    S.current.awards,
  ];

  int selectedCategory = 0;
  bool isShowMore = false;
  ScrollController scrollController = ScrollController();
  bool isPosition = false;
  DoctorData? doctorData;
  double maxExtent = 300.0;
  double currentExtent = 300.0;
  ScrollController reviewScrollController = ScrollController();
  bool isReviewLoading = false;
  int? start = 0;
  List<ReviewData>? reviewData;

  @override
  void onInit() {
    doctorProfileApiCall();
    initScrollController();
    reviewApiCall();
    fetchReviewData();
    scrollListener();
    super.onInit();
  }

  void scrollListener() {
    scrollController.addListener(() {
      currentExtent = maxExtent - scrollController.offset;
      if (currentExtent < 0) currentExtent = 0.0;
      if (currentExtent > maxExtent) currentExtent = maxExtent;
      update();
    });
  }

  void onShowMoreTap() {
    isShowMore = !isShowMore;
    update();
  }

  void onCategoryChange(int category) {
    selectedCategory = category;
    update();
  }

  void initScrollController() {
    scrollController.addListener(() {
      if (scrollController.offset > 270) {
        isPosition = true;
      } else {
        isPosition = false;
      }
    });
  }

  void doctorProfileApiCall() {
    ApiService.instance.fetchMyDoctorProfile().then((value) {
      doctorData = value.data;
      update();
    });
  }

  void navigateServiceScreen({required int type}) {
    Get.to(
      () => ServicesScreen(
        type: type,
      ),
    )?.then((value) {
      doctorProfileApiCall();
    });
  }

  void navigateServiceLocationScreen() {
    Get.to(
      () => const ServiceLocationScreen(),
    )?.then((value) {
      doctorProfileApiCall();
    });
  }

  void reviewApiCall() {
    isReviewLoading = true;
    ApiService.instance.fetchDoctorReviews(start: start).then((value) {
      if (start == 0) {
        reviewData = value.data;
      } else {
        reviewData?.addAll(value.data!);
      }
      start = reviewData?.length;
      isReviewLoading = false;
      update();
    });
  }

  void fetchReviewData() {
    reviewScrollController.addListener(
      () {
        if (reviewScrollController.offset ==
            reviewScrollController.position.maxScrollExtent) {
          if (!isReviewLoading) {
            reviewApiCall();
          }
        }
      },
    );
  }

  void onSettingTap() {
    Get.to(() => const SettingScreen())?.then((value) {
      doctorProfileApiCall();
      reviewApiCall();
    });
  }
}
