import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  final DoctorData? doctorData;

  const ExperiencePage({
    Key? key,
    this.doctorData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return doctorData?.experience == null || doctorData!.experience!.isEmpty
        ? CustomUi.noDataImage(message: S.current.nothingToShow)
        : ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            primary: false,
            itemCount: doctorData?.experience?.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 != 0 ? ColorRes.white : ColorRes.whiteSmoke,
              padding: const EdgeInsets.all(15),
              child: Text(
                doctorData?.experience?[index].title ?? S.current.noData,
                style: const TextStyle(
                    color: ColorRes.davyGrey,
                    fontSize: 14,
                    fontFamily: FontRes.regular),
              ),
            ),
          );
  }
}
