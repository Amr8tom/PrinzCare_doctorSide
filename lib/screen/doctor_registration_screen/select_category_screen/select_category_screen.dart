import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/common/doctor_reg_button.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctor_category/doctor_category.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/select_category_screen/select_category_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/style_res.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCategoryScreen extends StatelessWidget {
  const SelectCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SelectCategoryScreenController controller =
        Get.put(SelectCategoryScreenController());
    return Scaffold(
      body: Column(
        children: [
          TopBarArea(title: S.current.doctorRegistration),
          _searchArea(controller),
          _categories(controller),
          const SizedBox(
            height: 10,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: S.current.yourCategoryIsNotEtc,
              style: const TextStyle(
                  fontSize: 15,
                  color: ColorRes.battleshipGrey,
                  fontFamily: FontRes.regular),
              children: [
                TextSpan(
                  text: " ${S.current.suggestUs}",
                  recognizer: TapGestureRecognizer()
                    ..onTap = controller.onSuggestUsTap,
                  style: const TextStyle(
                      fontFamily: FontRes.semiBold,
                      color: ColorRes.havelockBlue),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          DoctorRegButton(
            onTap: controller.updateDoctorDetailsApiCall,
            title: S.current.continueText,
          )
        ],
      ),
    );
  }

  Widget _searchArea(SelectCategoryScreenController controller) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            S.current.selectYourCategory,
            style: const TextStyle(
                color: ColorRes.charcoalGrey,
                fontFamily: FontRes.semiBold,
                fontSize: 15),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: ColorRes.whiteSmoke,
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      hintText: S.current.search,
                      hintStyle: const TextStyle(
                          fontFamily: FontRes.medium,
                          fontSize: 15,
                          color: ColorRes.grey),
                    ),
                    style: const TextStyle(
                      color: ColorRes.charcoalGrey,
                      fontFamily: FontRes.semiBold,
                      fontSize: 15,
                    ),
                    onChanged: controller.onSearchCategories,
                    cursorHeight: 16,
                    cursorColor: ColorRes.charcoalGrey,
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  margin: const EdgeInsets.all(2.5),
                  decoration: const BoxDecoration(
                    color: ColorRes.greenWhite,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    color: ColorRes.charcoalGrey,
                    size: 20,
                    semanticLabel: S.current.close,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _categories(SelectCategoryScreenController controller) {
    return GetBuilder<SelectCategoryScreenController>(
      init: controller,
      builder: (controller) => Expanded(
        child: controller.filterList == null || controller.filterList!.isEmpty
            ? CustomUi.noData(message: S.current.emptyCategory)
            : GridView.builder(
                itemCount: controller.filterList?.length,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  DoctorCategoryData? categories =
                      controller.filterList?[index];
                  bool selected = controller.selectedCategories?.title
                          ?.contains('${categories?.title}') ??
                      false;
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      controller.onSelectedCategories(categories);
                    },
                    child: Card(
                      elevation: selected ? 2 : 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color:
                              selected ? null : ColorRes.cloud.withOpacity(0.2),
                          gradient: selected ? StyleRes.linearGradient : null,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            CachedNetworkImage(
                              imageUrl:
                                  '${ConstRes.itemBaseURL}${categories?.image}',
                              width: 35,
                              color: selected
                                  ? ColorRes.white
                                  : ColorRes.havelockBlue,
                              errorWidget: (context, url, error) {
                                return Container();
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              (categories?.title ?? S.current.unKnown)
                                  .toUpperCase(),
                              style: TextStyle(
                                  color: selected
                                      ? ColorRes.white
                                      : ColorRes.havelockBlue,
                                  fontFamily: FontRes.semiBold,
                                  fontSize: 13),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
