import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_flutter/common/doctor_profile_text_filed.dart';
import 'package:doctor_flutter/common/doctor_reg_button.dart';
import 'package:doctor_flutter/common/top_bar_area.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/add_bank_detail_screen/add_bank_detail_screen_controller.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBankDetailScreen extends StatelessWidget {
  const AddBankDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddBankDetailScreenController());
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Column(
        children: [
          TopBarArea(title: S.current.addBankDetails),
          Expanded(
            child: SingleChildScrollView(
              child: GetBuilder(
                  init: controller,
                  builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DoctorProfileTextField(
                          isExample: false,
                          title: S.current.bankName,
                          exampleTitle: "",
                          errorColor: controller.isBankName
                              ? ColorRes.bittersweet.withOpacity(0.2)
                              : ColorRes.whiteSmoke,
                          hintTextColor: controller.isBankName == true
                              ? ColorRes.bittersweet
                              : ColorRes.silverChalice,
                          hintTitle: controller.isBankName == true
                              ? S.current.enterBankName
                              : S.current.enterHere,
                          controller: controller.bankNameController,
                        ),
                        DoctorProfileTextField(
                          isExample: false,
                          title: S.current.accountNumber,
                          exampleTitle: "",
                          controller: controller.accountNumberController,
                          errorColor: controller.isAccountNumber == true
                              ? ColorRes.bittersweet.withOpacity(0.2)
                              : ColorRes.whiteSmoke,
                          hintTextColor: controller.isAccountNumber == true
                              ? ColorRes.bittersweet
                              : ColorRes.silverChalice,
                          hintTitle: controller.isAccountNumber == true
                              ? S.current.enterAccountName
                              : S.current.enterHere,
                        ),
                        DoctorProfileTextField(
                          isExample: false,
                          title: S.current.reEnterAccountNumber,
                          exampleTitle: "",
                          errorColor: controller.isReAccountNumber == true
                              ? ColorRes.bittersweet.withOpacity(0.2)
                              : ColorRes.whiteSmoke,
                          hintTextColor: controller.isReAccountNumber == true
                              ? ColorRes.bittersweet
                              : ColorRes.silverChalice,
                          hintTitle: controller.isReAccountNumber == true
                              ? S.current.enterReAccountNumber
                              : S.current.enterHere,
                          controller: controller.reAccountNumberController,
                        ),
                        DoctorProfileTextField(
                          isExample: false,
                          title: S.current.holdersName,
                          exampleTitle: "",
                          errorColor: controller.isHolderName == true
                              ? ColorRes.bittersweet.withOpacity(0.2)
                              : ColorRes.whiteSmoke,
                          hintTextColor: controller.isHolderName == true
                              ? ColorRes.bittersweet
                              : ColorRes.silverChalice,
                          hintTitle: controller.isHolderName == true
                              ? S.current.enterHolderName
                              : S.current.enterHere,
                          controller: controller.holderNameController,
                        ),
                        DoctorProfileTextField(
                          isExample: false,
                          title: S.current.swiftCode,
                          exampleTitle: "",
                          errorColor: controller.isSwiftCode == true
                              ? ColorRes.bittersweet.withOpacity(0.2)
                              : ColorRes.whiteSmoke,
                          hintTextColor: controller.isSwiftCode == true
                              ? ColorRes.bittersweet
                              : ColorRes.silverChalice,
                          hintTitle: controller.isSwiftCode == true
                              ? S.current.swiftCode
                              : S.current.enterHere,
                          controller: controller.swiftCodeController,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            S.current.cancelledChequePhoto,
                            style: const TextStyle(
                              fontFamily: FontRes.semiBold,
                              color: ColorRes.charcoalGrey,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: controller.onChequePhotoTap,
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: controller.chequePhoto != null
                                        ? Image.file(
                                            File(controller.chequePhoto!.path),
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                color: ColorRes.whiteSmoke,
                                              );
                                            },
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          )
                                        : controller.networkChequeImage != null
                                            ? CachedNetworkImage(
                                                imageUrl:
                                                    '${ConstRes.itemBaseURL}${controller.networkChequeImage}',
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.cover,
                                                errorWidget: (context, error,
                                                    stackTrace) {
                                                  return Container(
                                                      color:
                                                          ColorRes.whiteSmoke);
                                                },
                                              )
                                            : Container(
                                                color: ColorRes.whiteSmoke,
                                              ),
                                  ),
                                  Image.asset(
                                    AssetRes.messageAddBox,
                                    color: ColorRes.darkJungleGreen,
                                    width: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ),
          DoctorRegButton(
              onTap: controller.manageDrBankAccountApiCall,
              title: S.current.add)
        ],
      ),
    );
  }
}
