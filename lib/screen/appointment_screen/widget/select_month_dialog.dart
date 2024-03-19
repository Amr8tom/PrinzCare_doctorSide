import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SelectMonthDialog extends StatefulWidget {
  final Function(int month, int year) onDoneClick;
  final int? month;
  final int? year;

  const SelectMonthDialog({
    Key? key,
    required this.onDoneClick,
    this.month,
    this.year,
  }) : super(key: key);

  @override
  State<SelectMonthDialog> createState() => _SelectMonthDialogState();
}

class _SelectMonthDialogState extends State<SelectMonthDialog> {
  int selectedIndex = 0;
  int year = DateTime.now().year;
  int currentYear = DateTime.now().year;
  List<String> months = [
    S.current.jan,
    S.current.feb,
    S.current.mar,
    S.current.apr,
    S.current.may,
    S.current.jun,
    S.current.jul,
    S.current.aug,
    S.current.sep,
    S.current.oct,
    S.current.nov,
    S.current.dec,
  ];

  @override
  void initState() {
    selectedIndex = widget.month != null ? widget.month! - 1 : 0;
    year = widget.year ?? DateTime.now().year;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        S.of(context).selectMonth,
                        style: const TextStyle(
                            color: ColorRes.tuftsBlue,
                            fontSize: 18,
                            fontFamily: FontRes.semiBold),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          year--;
                          if (year >= currentYear) {
                            setState(() {});
                          } else {
                            year++;
                          }
                        },
                        child: Icon(
                          Directionality.of(context) == TextDirection.rtl
                              ? Icons.keyboard_arrow_right_rounded
                              : Icons.keyboard_arrow_left_rounded,
                          color: ColorRes.tuftsBlue,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          year.toString(),
                          style: const TextStyle(
                            color: ColorRes.tuftsBlue,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          year++;
                          if (year <= currentYear + 1) {
                            setState(() {});
                          } else {
                            year--;
                          }
                        },
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: Icon(
                            Directionality.of(context) == TextDirection.rtl
                                ? Icons.keyboard_arrow_right_rounded
                                : Icons.keyboard_arrow_left_rounded,
                            color: ColorRes.tuftsBlue,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      childAspectRatio: 1 / .6,
                    ),
                    shrinkWrap: true,
                    children: List.generate(
                      months.length,
                      (index) => InkWell(
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? ColorRes.tuftsBlue
                                : Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 2,
                          ),
                          child: Center(
                            child: Text(
                              months[index],
                              style: TextStyle(
                                color: selectedIndex == index
                                    ? ColorRes.white
                                    : ColorRes.grey,
                                fontFamily: FontRes.medium,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorRes.whiteSmoke,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: Text(
                            S.of(context).cancel,
                            style: const TextStyle(
                                color: ColorRes.battleshipGrey,
                                fontSize: 16,
                                fontFamily: FontRes.semiBold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          widget.onDoneClick(selectedIndex + 1, year);
                          Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorRes.tuftsBlue,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: Text(
                            S.of(context).done,
                            style: const TextStyle(
                                color: ColorRes.white,
                                fontSize: 16,
                                fontFamily: FontRes.semiBold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
