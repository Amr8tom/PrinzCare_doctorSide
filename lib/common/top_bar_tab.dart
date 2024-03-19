import 'package:doctor_flutter/utils/color_res.dart';
import 'package:flutter/material.dart';

class TopBarTab extends StatelessWidget {
  final String title;

  const TopBarTab({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.whiteSmoke,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 23),
      child: SafeArea(
        bottom: false,
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: ColorRes.charcoalGrey,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
