import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/common/top_bar_tab.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/appointment/appointment_request.dart';
import 'package:doctor_flutter/screen/request_screen/request_screen_controller.dart';
import 'package:doctor_flutter/screen/request_screen/widget/request_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = RequestScreenController();
    return Column(
      children: [
        TopBarTab(title: S.current.requests),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: GetBuilder(
            init: controller,
            builder: (context) {
              return controller.isLoading
                  ? CustomUi.loaderWidget()
                  : controller.appointment.isEmpty
                      ? CustomUi.noDataImage(message: S.current.noRequestData)
                      : ListView.builder(
                          controller: controller.requestController,
                          itemCount: controller.appointment.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            AppointmentData? data =
                                controller.appointment[index];
                            return InkWell(
                              onTap: () {
                                controller.onViewTap(data);
                              },
                              child: UserCard(
                                isViewVisible: true,
                                appointmentData: data,
                                onViewTap: () => controller.onViewTap(data),
                              ),
                            );
                          },
                        );
            },
          ),
        ),
      ],
    );
  }
}
