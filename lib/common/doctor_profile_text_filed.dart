import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:doctor_flutter/utils/update_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoctorProfileTextField extends StatelessWidget {
  final bool isExample;
  final double textFieldHeight;
  final String title;
  final String exampleTitle;
  final String hintTitle;
  final bool isExpand;
  final bool isDollar;
  final TextInputType textInputType;
  final TextEditingController controller;
  final Color textFieldColor;
  final String textFieldFontFamily;
  final FocusNode? focusNode;
  final Function(String value)? onChange;
  final Color hintTextColor;
  final Color errorColor;
  final int? maxLength;
  final TextAlign textAlign;

  const DoctorProfileTextField({
    Key? key,
    this.isExample = true,
    this.textFieldHeight = 50,
    required this.title,
    required this.exampleTitle,
    required this.hintTitle,
    this.isExpand = false,
    this.isDollar = false,
    this.textInputType = TextInputType.text,
    required this.controller,
    this.textFieldColor = ColorRes.battleshipGrey,
    this.textFieldFontFamily = FontRes.medium,
    this.focusNode,
    this.onChange,
    this.hintTextColor = ColorRes.silverChalice,
    this.errorColor = ColorRes.whiteSmoke,
    this.maxLength,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: ColorRes.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: FontRes.semiBold,
                  color: ColorRes.charcoalGrey,
                  fontSize: 15,
                ),
              ),
              Visibility(
                visible: isExample,
                child: const SizedBox(
                  height: 5,
                ),
              ),
              Visibility(
                visible: isExample,
                child: Text(
                  exampleTitle,
                  style: const TextStyle(
                    fontFamily: FontRes.regular,
                    color: ColorRes.battleshipGrey,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Container(
          height: textFieldHeight,
          decoration: BoxDecoration(
            color: errorColor,
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              Visibility(
                visible: isDollar,
                child: Container(
                  height: textFieldHeight,
                  width: textFieldHeight,
                  color: ColorRes.mercury,
                  alignment: Alignment.center,
                  child: Text(
                    dollar,
                    style: const TextStyle(
                        color: ColorRes.charcoalGrey,
                        fontFamily: FontRes.semiBold,
                        fontSize: 16),
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  textAlign: textAlign,
                  focusNode: focusNode,
                  expands: isExpand,
                  minLines: isExpand ? null : 1,
                  maxLines: isExpand ? null : 1,
                  inputFormatters: [
                    if (isDollar) ThousandsSeparatorInputFormatter()
                  ],
                  textAlignVertical: isExpand
                      ? TextAlignVertical.top
                      : TextAlignVertical.center,
                  onChanged: onChange,
                  keyboardType: textInputType,
                  maxLength: maxLength,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: isExpand ? 10 : 0,
                    ),
                    counterText: "",
                    border: InputBorder.none,
                    hintText: hintTitle,
                    hintStyle: TextStyle(
                      fontFamily: FontRes.medium,
                      color: hintTextColor,
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: textFieldFontFamily,
                    color: textFieldColor,
                    fontSize: 15,
                  ),
                  cursorHeight: 15,
                  cursorColor: ColorRes.charcoalGrey,
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1) {
          newString = separator + newString;
        }
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
