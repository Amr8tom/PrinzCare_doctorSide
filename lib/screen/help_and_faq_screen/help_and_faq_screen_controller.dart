import 'package:doctor_flutter/model/global/faq_cat.dart';
import 'package:doctor_flutter/service/api_service.dart';
import 'package:get/get.dart';

class HelpAndFaqScreenController extends GetxController {
  int selectedCategory = 0;
  List<FaqCatData>? faqData;

  @override
  void onInit() {
    fetchFaqCatsApiCall();
    super.onInit();
  }

  void onCategoryChange(int category) {
    selectedCategory = category;
    update();
  }

  void fetchFaqCatsApiCall() {
    ApiService.instance.fetchFaqCats().then((value) {
      faqData = value.data;
      update();
    });
  }
}
