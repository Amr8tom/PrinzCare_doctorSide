import 'package:doctor_flutter/model/countries/countries.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';

class CountryDropDown extends StatelessWidget {
  final List<Country>? countries;
  final Country? initialValue;
  final String fontFamily;
  final Color textColor;
  final double radius;
  final Function(Country? contry) onChange;
  final Color iconColor;

  const CountryDropDown(
      {Key? key,
      required this.countries,
      required this.initialValue,
      required this.onChange,
      this.fontFamily = FontRes.bold,
      this.textColor = ColorRes.charcoalGrey,
      this.radius = 10,
      this.iconColor = ColorRes.battleshipGrey})
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
        borderRadius: BorderRadius.circular(radius),
      ),
      child: DropdownButton<Country?>(
        value: initialValue,
        isExpanded: true,
        menuMaxHeight: 200,
        iconEnabledColor: iconColor,
        alignment: Alignment.center,
        onChanged: onChange,
        items: countries
            ?.map<DropdownMenuItem<Country>>(
                (Country value) => DropdownMenuItem<Country>(
                      value: value,
                      child: Text(
                        value.countryName ?? '',
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
