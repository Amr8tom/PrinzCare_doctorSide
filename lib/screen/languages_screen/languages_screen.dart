import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/languages_screen/languages_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LanguagesScreenController());
    return Scaffold(
      body: GetBuilder(
          init: controller,
          builder: (context) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  color: ColorRes.whiteSmoke,
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: SafeArea(
                    bottom: false,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Directionality.of(Get.context!) ==
                                  TextDirection.rtl
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                                margin: EdgeInsets.only(
                                    left: Directionality.of(Get.context!) ==
                                            TextDirection.rtl
                                        ? 0
                                        : 10,
                                    right: Directionality.of(Get.context!) ==
                                            TextDirection.rtl
                                        ? 10
                                        : 0),
                                child: const Icon(Icons.arrow_back_rounded)),
                          ),
                        ),
                        Text(
                          S.current.languages,
                          style: const TextStyle(
                              color: ColorRes.charcoalGrey,
                              fontFamily: FontRes.bold,
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SafeArea(
                    top: false,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          value: index,
                          groupValue: controller.value,
                          dense: true,
                          onChanged: controller.onLanguageChange,
                          title: Text(controller.languages[index],
                              style: const TextStyle(
                                  color: ColorRes.charcoalGrey,
                                  fontFamily: FontRes.semiBold,
                                  fontSize: 15)),
                          subtitle: Text(controller.subLanguage[index],
                              style: const TextStyle(
                                color: ColorRes.battleshipGrey,
                                fontFamily: FontRes.regular,
                              )),
                        );
                      },
                      itemCount: controller.languages.length,
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}

// class RadioListBuilder extends StatefulWidget {
//   final int num;
//
//   const RadioListBuilder({Key? key, required this.num}) : super(key: key);
//
//   @override
//   RadioListBuilderState createState() {
//     return RadioListBuilderState();
//   }
// }
//
// class RadioListBuilderState extends State<RadioListBuilder> {
//   int? value;
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
