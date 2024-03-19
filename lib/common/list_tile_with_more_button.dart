import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/screen/services_screen/services_screen_controller.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:flutter/material.dart';

class ListTileWithMoreButton extends StatelessWidget {
  final List<Services>? data;
  final ServicesScreenController controller;
  final int screenType;
  final String noData;

  const ListTileWithMoreButton(
      {Key? key,
      this.data,
      required this.controller,
      required this.screenType,
      required this.noData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: data == null || data!.isEmpty
          ? CustomUi.noData(message: noData)
          : ListView.builder(
              itemCount: data?.length,
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Services? services = data?[index];
                return Container(
                  color: ColorRes.whiteSmoke,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          services?.title ?? '',
                          style: const TextStyle(
                              fontSize: 14, color: ColorRes.davyGrey),
                        ),
                      ),
                      PopUpMenuCustom(
                          services: services,
                          controller: controller,
                          screenType: screenType)
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class PopUpMenuCustom extends StatelessWidget {
  final Services? services;
  final ServicesScreenController controller;
  final int screenType;

  const PopUpMenuCustom(
      {Key? key,
      this.services,
      required this.controller,
      required this.screenType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: ColorRes.whiteSmoke,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)),
      ),
      child: Image.asset(
        AssetRes.icMore,
        width: 18,
        color: ColorRes.tuftsBlue,
      ),
      onSelected: (value) {
        controller.serviceController =
            TextEditingController(text: services?.title ?? '');
        if (value == 0) {
          controller.onServiceSheetOpen(
              apiType: 2,
              id: services?.id,
              isAdd: false,
              screenType: screenType);
        } else {
          controller.onAddBtnTap(
              apiType: 3, id: services?.id, screenType: screenType);
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: Text(S.current.edit),
        ),
        PopupMenuItem(
          value: 1,
          child: Text(S.current.delete),
        ),
      ],
    );
  }
}
