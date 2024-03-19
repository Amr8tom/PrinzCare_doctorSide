import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_flutter/common/common_fun.dart';
import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/appointment/appointment_request.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/extention.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final bool isViewVisible;
  final AppointmentData? appointmentData;
  final VoidCallback onViewTap;

  const UserCard(
      {Key? key,
      this.isViewVisible = false,
      this.appointmentData,
      required this.onViewTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: ColorRes.whiteSmoke, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: appointmentData?.user?.profileImage == null ||
                    appointmentData!.user!.profileImage!.isEmpty
                ? CustomUi.userPlaceHolder(
                    height: 70,
                    male: appointmentData?.user?.gender ?? 0,
                  )
                : CachedNetworkImage(
                    imageUrl:
                        '${ConstRes.itemBaseURL}${appointmentData?.user?.profileImage}',
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                    errorWidget: (context, error, stackTrace) {
                      return CustomUi.userPlaceHolder(
                        height: 70,
                        male: appointmentData?.user?.gender ?? 0,
                      );
                    },
                  ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  appointmentData?.user?.fullname ?? S.current.unKnown,
                  style: const TextStyle(
                      color: ColorRes.charcoalGrey,
                      fontFamily: FontRes.extraBold,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${appointmentData?.user?.dob == null ? '0' : CommonFun.calculateAge(appointmentData?.user?.dob ?? '')} ${S.current.years}: ${appointmentData?.user?.gender == 1 ? S.current.male : S.current.feMale}",
                  style: const TextStyle(
                      fontFamily: FontRes.medium,
                      color: ColorRes.battleshipGrey,
                      fontSize: 13,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  // (appointmentData?.createdAt ?? createdDate)
                  //     .dateParse(ddMmmYyyyEeeHhMmA),
                  '${(appointmentData?.date ?? '').appointmentDate} ${(appointmentData?.time ?? '').appointmentTime}',
                  style: const TextStyle(
                      fontFamily: FontRes.medium,
                      color: ColorRes.battleshipGrey,
                      fontSize: 13,
                      overflow: TextOverflow.ellipsis),
                )
              ],
            ),
          ),
          Visibility(
            visible: isViewVisible,
            child: InkWell(
              onTap: onViewTap,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                decoration: BoxDecoration(
                    color: ColorRes.greenWhite,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  S.current.view,
                  style: const TextStyle(
                    color: ColorRes.tuftsBlue,
                    fontFamily: FontRes.semiBold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
