import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/profile_screen/profile_screen_controller.dart';
import 'package:doctor_flutter/screen/profile_screen/widget/award_page.dart';
import 'package:doctor_flutter/screen/profile_screen/widget/detail_page.dart';
import 'package:doctor_flutter/screen/profile_screen/widget/education_page.dart';
import 'package:doctor_flutter/screen/profile_screen/widget/experience_page.dart';
import 'package:doctor_flutter/screen/profile_screen/widget/list_of_category.dart';
import 'package:doctor_flutter/screen/profile_screen/widget/profile_top_bar_card.dart';
import 'package:doctor_flutter/screen/profile_screen/widget/review_page.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileScreenController());
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              GetBuilder(
                init: controller,
                builder: (controller) {
                  var temp = (controller.currentExtent * 0.233333);
                  var size = temp < 35.0 ? 35.0 : temp;
                  var o = (-1 * (size - 70)) * 0.02857143;
                  var opacity = 1 - (o > 1.0 ? 1.0 : o);
                  return SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.white,
                    expandedHeight: controller.maxExtent,
                    collapsedHeight: 60,
                    stretch: true,
                    shadowColor: Colors.transparent,
                    leadingWidth: 0,
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                      expandedTitleScale: 1,
                      titlePadding: const EdgeInsets.all(0),
                      collapseMode: CollapseMode.pin,
                      title: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              color: ColorRes.white,
                              padding: const EdgeInsets.only(
                                bottom: 10,
                                left: 10,
                                right: 10,
                                top: 10,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    controller.doctorData?.name ??
                                        S.current.unKnown,
                                    style: const TextStyle(
                                        fontFamily: FontRes.extraBold,
                                        color: ColorRes.charcoalGrey,
                                        fontSize: 23),
                                  ),
                                  const Spacer(),
                                  Opacity(
                                    opacity: opacity,
                                    child: controller.doctorData?.rating
                                                ?.toStringAsFixed(2) ==
                                            '0.00'
                                        ? const SizedBox()
                                        : Container(
                                            height: 28,
                                            width: 70,
                                            // decoration: BoxDecoration(
                                            //     color: ColorRes.mangoOrange
                                            //         .withOpacity(0.15),
                                            //     borderRadius:
                                            //         BorderRadius.circular(15)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  (controller.doctorData
                                                              ?.rating ??
                                                          0)
                                                      .toStringAsFixed(2),
                                                  style: const TextStyle(
                                                      color:
                                                          ColorRes.mangoOrange,
                                                      fontSize: 18,
                                                      fontFamily:
                                                          FontRes.semiBold),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: ColorRes.mangoOrange,
                                                )
                                              ],
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SafeArea(
                            bottom: false,
                            child: Align(
                              alignment: Directionality.of(context) ==
                                      TextDirection.rtl
                                  ? Alignment.topLeft
                                  : Alignment.topRight,
                              child: Container(
                                padding: const EdgeInsets.only(
                                    right: 15, left: 7, top: 25),
                                child: InkWell(
                                  onTap: controller.onSettingTap,
                                  child: Icon(
                                    Icons.settings,
                                    color: opacity > 0.01
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      stretchModes: const [
                        StretchMode.zoomBackground,
                      ],
                      background: controller.doctorData?.image != null
                          ? CachedNetworkImage(
                              imageUrl:
                                  '${ConstRes.itemBaseURL}${controller.doctorData?.image}',
                              fit: BoxFit.cover,
                              errorWidget: (context, error, stackTrace) {
                                return CustomUi.doctorPlaceHolder(
                                    male: controller.doctorData?.gender);
                              },
                            )
                          : CustomUi.doctorPlaceHolder(
                              male: controller.doctorData?.gender),
                    ),
                  );
                },
              ),
              GetBuilder(
                init: controller,
                builder: (context) {
                  return SliverToBoxAdapter(
                    child: Column(
                      children: [
                        ProfileTopBarCard(doctorData: controller.doctorData),
                        ListOfCategory(controller: controller),
                        controller.selectedCategory == 0
                            ? DetailPage(
                                controller: controller,
                              )
                            : controller.selectedCategory == 1
                                ? ExperiencePage(
                                    doctorData: controller.doctorData,
                                  )
                                : controller.selectedCategory == 2
                                    ? EducationPage(
                                        doctorData: controller.doctorData,
                                      )
                                    : controller.selectedCategory == 3
                                        ? ReviewPage(
                                            reviewScrollController: controller
                                                .reviewScrollController,
                                            doctorData: controller.doctorData,
                                            reviewData: controller.reviewData,
                                          )
                                        : AwardPage(
                                            doctorData: controller.doctorData,
                                          ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
          GetBuilder(
              init: controller,
              builder: (context) {
                return controller.doctorData?.status == 2
                    ? Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: ColorRes.black.withOpacity(0.3),
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.only(right: 15, top: 25),
                        child: SafeArea(
                          child: InkWell(
                            onTap: controller.onSettingTap,
                            child: const Icon(Icons.settings,
                                color: ColorRes.white),
                          ),
                        ),
                      )
                    : const SizedBox();
              }),
        ],
      ),
    );
  }
}
