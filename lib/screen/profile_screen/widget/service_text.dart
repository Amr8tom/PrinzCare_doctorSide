import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';

class ServiceText extends StatelessWidget {
  final int? itemCount;
  final List<Services>? services;

  const ServiceText({Key? key, required this.itemCount, required this.services})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            color: index % 2 == 0 ? ColorRes.whiteSmoke : ColorRes.snowDrift,
          ),
          child: Text(
            services?[index].title ?? S.current.noData,
          ),
        );
      },
    );
  }
}

class ServiceHeading extends StatelessWidget {
  final String heading;
  final VoidCallback onManageTap;
  final bool isManageVisible;

  const ServiceHeading(
      {Key? key,
      required this.heading,
      required this.onManageTap,
      required this.isManageVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 15,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Row(
          children: [
            Text(
              heading,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: FontRes.semiBold,
                color: ColorRes.charcoalGrey,
                letterSpacing: 1,
              ),
            ),
            const Spacer(),
            Visibility(
              visible: isManageVisible,
              child: InkWell(
                onTap: onManageTap,
                child: Text(
                  S.current.manage,
                  style: const TextStyle(
                    color: ColorRes.havelockBlue,
                    fontFamily: FontRes.semiBold,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 15,
      ),
    ]);
  }
}
