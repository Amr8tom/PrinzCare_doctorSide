import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/extention.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';

class ProfileTopBarCard extends StatelessWidget {
  final DoctorData? doctorData;

  const ProfileTopBarCard({Key? key, this.doctorData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorRes.white,
        boxShadow: [
          BoxShadow(
            color: ColorRes.softPeach,
            blurRadius: 5.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              5.0, // Move to right 5  horizontally
              5.0, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      child: Column(
        children: [
          _profileCard(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _profileCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Image.asset(
              //   AssetRes.stethoscope,
              //   width: 20,
              // ),
              Icon(Icons.medical_information_outlined),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  doctorData?.designation ?? S.current.addYourDesignation,
                  style: const TextStyle(
                      color: ColorRes.havelockBlue, fontSize: 15),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            doctorData?.degrees ?? S.current.addYourDegreesEtc,
            style: const TextStyle(fontSize: 14, color: ColorRes.mediumGrey),
          ),
          const Divider(),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: ColorRes.havelockBlue,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  doctorData?.clinicAddress ?? S.current.noAddressFound,
                  style: const TextStyle(
                    fontSize: 14,
                    color: ColorRes.mediumGrey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              _portfolioCard(
                title1: "${doctorData?.experienceYear ?? '0'}",
                title2: S.current.years,
                category: S.current.experience,
              ),
              const SizedBox(
                width: 10,
              ),
              _portfolioCard(
                title1: doctorData?.totalPatientsCured?.number ?? '0',
                title2: "",
                category: S.current.happyPatients,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _portfolioCard(
      {required String title1,
      required String title2,
      required String category}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 2,
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorRes.whiteSmoke.withOpacity(0.7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: title1,
                style: const TextStyle(
                    color: ColorRes.charcoalGrey,
                    fontFamily: FontRes.bold,
                    fontSize: 17),
                children: [
                  TextSpan(
                    text: " $title2",
                    style: const TextStyle(
                      color: ColorRes.charcoalGrey,
                      fontSize: 13,
                      fontFamily: FontRes.regular,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              category.toUpperCase(),
              style: const TextStyle(
                  color: ColorRes.havelockBlue,
                  fontSize: 12,
                  fontFamily: FontRes.medium,
                  overflow: TextOverflow.ellipsis,
                  letterSpacing: 0.5),
            )
          ],
        ),
      ),
    );
  }
}
