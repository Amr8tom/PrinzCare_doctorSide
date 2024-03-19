import 'dart:convert';

import 'package:doctor_flutter/common/animate_expansion.dart';
import 'package:doctor_flutter/common/common_fun.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/appointment/appointment_request.dart';
import 'package:doctor_flutter/model/custom/order_summary.dart';
import 'package:doctor_flutter/model/global/taxes.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentDetailCard extends StatelessWidget {
  final AppointmentData? data;
  final bool? isExpand;
  final Function(bool value) onExpandTap;

  const AppointmentDetailCard({
    Key? key,
    this.data,
    this.isExpand,
    required this.onExpandTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderSummary? summary = OrderSummary.fromJson(
      jsonDecode(
        data?.orderSummary ?? '',
      ),
    );
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorRes.snowDrift,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppointmentCardFiled(
                  title: S.current.date,
                  desc: CommonFun.dateFormat(data?.date, 2)),
              AppointmentCardFiled(
                  title: S.current.time,
                  desc: CommonFun.convert24HoursInto12Hours(data?.time)),
              AppointmentCardFiled(
                  title: S.current.type,
                  desc:
                      data?.type == 0 ? S.current.online : S.current.atClinic),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedExpansion(
            expand: data?.status == 2 ? (isExpand ?? false) : true,
            child: Column(
              children: [
                /// Service change amount
                _paymentFiled(
                    title: S.current.consultationCharge,
                    amount: summary.serviceAmount ?? 0),
                const SizedBox(
                  height: 3,
                ),

                /// Coupon Discount Amount
                Visibility(
                  visible: summary.couponApply == 1,
                  child: _paymentFiled(
                      title: S.current.couponDiscount,
                      amount: summary.discountAmount ?? 0,
                      isCouponCodeVisible: true,
                      couponCode: summary.coupon?.coupon,
                      isCloseBtnVisible: true),
                ),
                const SizedBox(
                  height: 3,
                ),

                /// Taxable Amount
                _paymentFiled(
                    title: S.current.subTotal,
                    amount: summary.subtotal ?? 0,
                    color: ColorRes.softPeach),
                const SizedBox(
                  height: 3,
                ),

                /// All taxes separate amount
                Visibility(
                  visible: summary.taxes != null,
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: summary.taxes?.length,
                    itemBuilder: (context, index) {
                      Taxes? tax = summary.taxes?[index];
                      return Container(
                        color: ColorRes.aquaHaze,
                        margin: const EdgeInsets.only(bottom: 3),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: '${tax?.taxTitle} ',
                                    style: const TextStyle(
                                        fontFamily: FontRes.medium,
                                        color: ColorRes.davyGrey,
                                        fontSize: 16),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: tax?.type == 0
                                              ? '(${tax?.value ?? ''}$percentage)'
                                              : '',
                                          style: const TextStyle(
                                              fontFamily: FontRes.bold,
                                              color: ColorRes.tuftsBlue,
                                              fontSize: 13)),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '$dollar${NumberFormat(numberFormat).format(tax?.taxAmount ?? 0)}',
                                  style: const TextStyle(
                                      fontFamily: FontRes.bold,
                                      fontSize: 17,
                                      color: ColorRes.tuftsBlue),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                /// payable amount
                _paymentFiled(
                    title: S.current.payableAmount,
                    amount: summary.payableAmount ?? 0),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Visibility(
            visible: data?.status == 2,
            child: Theme(
              data: ThemeData(
                dividerColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
                child: ListTileTheme(
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 0,
                  ),
                  child: ExpansionTile(
                    trailing: const SizedBox(width: 30),
                    expandedAlignment: Alignment.center,
                    maintainState: false,
                    onExpansionChanged: onExpandTap,
                    title: Center(
                      child: Image.asset(
                        AssetRes.icMore,
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                      ),
                    ),
                    tilePadding: EdgeInsets.zero,
                    collapsedBackgroundColor: ColorRes.whiteSmoke,
                    iconColor: ColorRes.davyGrey,
                    childrenPadding: EdgeInsets.zero,
                    leading: const SizedBox(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _paymentFiled(
      {required String title,
      required num amount,
      String? couponCode,
      bool isCouponCodeVisible = false,
      bool isCloseBtnVisible = false,
      Color color = ColorRes.aquaHaze}) {
    return Container(
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: FontRes.medium,
                  fontSize: 16,
                  color: ColorRes.davyGrey,
                ),
              ),
              const Spacer(),
              Text(
                '${isCouponCodeVisible == true ? '-' : ''}$dollar${NumberFormat(numberFormat).format(amount)}',
                style: const TextStyle(
                    fontFamily: FontRes.bold,
                    fontSize: 17,
                    color: ColorRes.tuftsBlue),
              )
            ],
          ),
          Visibility(
            visible: isCouponCodeVisible,
            child: const SizedBox(
              height: 10,
            ),
          ),
          Visibility(
            visible: isCouponCodeVisible,
            child: FittedBox(
              child: Container(
                decoration: BoxDecoration(
                    color: ColorRes.dawnPink,
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      alignment: Alignment.center,
                      child: Text(
                        '$couponCode'.toUpperCase(),
                        style: const TextStyle(
                            color: ColorRes.tuftsBlue,
                            fontFamily: FontRes.bold,
                            fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentCardFiled extends StatelessWidget {
  final String title;
  final String desc;

  const AppointmentCardFiled(
      {Key? key, required this.title, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15, color: ColorRes.battleshipGrey),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          desc,
          style: const TextStyle(
              fontSize: 16,
              color: ColorRes.tuftsBlue,
              fontFamily: FontRes.semiBold),
        ),
      ],
    );
  }
}
