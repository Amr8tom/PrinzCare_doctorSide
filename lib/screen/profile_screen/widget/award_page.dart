import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:flutter/material.dart';

class AwardPage extends StatelessWidget {
  final DoctorData? doctorData;

  const AwardPage({
    Key? key,
    this.doctorData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return doctorData?.awards == null || doctorData!.awards!.isEmpty
        ? CustomUi.noDataImage()
        : ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            primary: false,
            itemCount: doctorData?.awards?.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 != 0 ? ColorRes.white : ColorRes.whiteSmoke,
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetRes.award,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      doctorData?.awards?[index].title ?? S.current.noData,
                      style: const TextStyle(
                          color: ColorRes.davyGrey, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
