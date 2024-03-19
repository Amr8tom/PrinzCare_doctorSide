import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/screen/languages_screen/languages_screen_controller.dart';
import 'package:doctor_flutter/screen/my_app/my_app_controller.dart';
import 'package:doctor_flutter/screen/splash_screen/splash_screen.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyAppController());
    return GetMaterialApp(

      onInit: controller.onInit,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(LanguagesScreenController.selectedLanguage),
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        fontFamily: FontRes.regular,
      ),
      home: const SplashScreen(),
    );
  }
}
