import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/countries/countries.dart';
import 'package:doctor_flutter/screen/doctor_registration_screen/starting_profile_screen/starting_profile_screen_controller.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountrySheet extends StatelessWidget {
  final List<Country> country;
  final Function(String name) onCountryChange;
  final TextEditingController controller;
  final Function(Country countryName) onCountryTap;
  final StartingProfileScreenController screenController;

  const CountrySheet(
      {Key? key,
      required this.country,
      required this.onCountryChange,
      required this.onCountryTap,
      required this.controller,
      required this.screenController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: screenController,
      builder: (c) => AspectRatio(
        aspectRatio: 0.8,
        child: Container(
          margin: EdgeInsets.only(top: AppBar().preferredSize.height),
          decoration: const BoxDecoration(
              color: ColorRes.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.selectCountry,
                style: const TextStyle(
                    color: ColorRes.charcoalGrey,
                    fontSize: 19,
                    fontFamily: FontRes.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: ColorRes.whiteSmoke,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: controller,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      hintText: S.of(context).searchCountryName,
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          color: ColorRes.nobel,
                          fontFamily: FontRes.semiBold)),
                  style: const TextStyle(
                      fontSize: 14,
                      color: ColorRes.charcoalGrey,
                      fontFamily: FontRes.medium),
                  onChanged: onCountryChange,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: country.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    Country c = country[index];
                    return InkWell(
                      onTap: () => onCountryTap(c),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10),
                        child: Text(
                          c.countryName ?? '',
                          style: const TextStyle(
                            color: ColorRes.charcoalGrey,
                            fontFamily: FontRes.semiBold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
