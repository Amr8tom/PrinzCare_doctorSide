import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/appointment_screen/widget/select_month_dialog.dart';
import 'package:doctor_flutter/screen/earning_report_screen/earning_report_screen_controller.dart';
import 'package:doctor_flutter/utils/asset_res.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartBox extends StatelessWidget {
  final EarningReportScreenController controller;

  const ChartBox({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 0.7,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: ColorRes.whiteSmoke,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Row(
              children: [
                GetBuilder(
                    init: controller,
                    builder: (context) {
                      return Text(
                        "$dollar${controller.thisMonthEarning}",
                        style: const TextStyle(
                            color: ColorRes.tuftsBlue,
                            fontFamily: FontRes.extraBold,
                            fontSize: 19),
                      );
                    }),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: ColorRes.battleshipGrey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        AssetRes.icCalender,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => SelectMonthDialog(
                              onDoneClick: controller.onDoneClick,
                              month: controller.month,
                              year: controller.year,
                            ),
                          );
                        },
                        child: GetBuilder(
                            init: controller,
                            builder: (context) {
                              return Text(
                                " ${DateFormat(mmmm, 'en').format(DateTime(controller.year, controller.month))} ${controller.year}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: FontRes.semiBold,
                                    color: ColorRes.tuftsBlue),
                              );
                            }),
                      ),
                      const SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: GetBuilder<EarningReportScreenController>(
                init: controller,
                builder: (controller) {
                  return SfCartesianChart(
                    borderColor: Colors.transparent,
                    series: <ChartSeries>[
                      LineSeries<SalesData, int>(
                        dataSource: controller.chartData,
                        xAxisName: S.current.sale,
                        yAxisName: S.current.purchase,
                        xValueMapper: (SalesData data, _) => data.x,
                        yValueMapper: (SalesData data, _) => data.y,
                        color: ColorRes.crystalBlue,
                        isVisibleInLegend: false,
                        markerSettings: const MarkerSettings(
                            shape: DataMarkerType.circle,
                            borderColor: ColorRes.tuftsBlue,
                            height: 5,
                            width: 5,
                            borderWidth: 2,
                            color: ColorRes.tuftsBlue,
                            isVisible: true),
                        width: 1,
                      ),
                    ],
                    primaryXAxis: CategoryAxis(
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      majorGridLines: const MajorGridLines(width: 0),
                      axisLabelFormatter: (axisLabelRenderArgs) {
                        return ChartAxisLabel(
                          axisLabelRenderArgs.text,
                          const TextStyle(
                            color: ColorRes.battleshipGrey,
                          ),
                        );
                      },
                    ),
                    tooltipBehavior: TooltipBehavior(
                      enable: true,
                      activationMode: ActivationMode.singleTap,
                      color: ColorRes.tuftsBlue,
                      animationDuration: 600,
                      duration: 1500,
                      canShowMarker: true,
                      elevation: 5,
                      header: S.current.earningPerDay,
                      tooltipPosition: TooltipPosition.auto,
                      shadowColor: ColorRes.tuftsBlue100,
                      format: chartFormat,
                      textStyle: const TextStyle(
                        fontFamily: FontRes.semiBold,
                        fontSize: 13,
                        color: ColorRes.white,
                      ),
                    ),
                    zoomPanBehavior: ZoomPanBehavior(
                      enablePinching: true,
                      zoomMode: ZoomMode.x,
                      enablePanning: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
