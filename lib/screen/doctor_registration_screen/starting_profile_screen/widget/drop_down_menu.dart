import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';

class DropDownMenu extends StatelessWidget {
  final List<String> items;
  final String initialValue;
  final String fontFamily;
  final Color textColor;
  final double radius;
  final Function(String? onChange) onChange;

  const DropDownMenu(
      {Key? key,
      required this.items,
      required this.initialValue,
      required this.onChange,
      this.fontFamily = FontRes.bold,
      this.textColor = ColorRes.charcoalGrey,
      this.radius = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
          color: ColorRes.whiteSmoke,
          borderRadius: BorderRadius.circular(radius)),
      child: DropdownButton<String>(
        value: initialValue,
        isExpanded: true,
        alignment: Alignment.center,
        onChanged: onChange,
        items: items
            .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            fontFamily: fontFamily,
                            color: textColor,
                            fontSize: 15),
                      ),
                    ))
            .toList(),
        underline: const SizedBox(),
      ),
    );
  }
}
