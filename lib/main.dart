import 'dart:io';
import 'package:doctor_flutter/screen/languages_screen/languages_screen_controller.dart';
import 'package:doctor_flutter/screen/my_app/my_app.dart';
import 'package:doctor_flutter/service/pref_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timezone/data/latest.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  initializeTimeZones();
  PrefService prefService = PrefService();
  await prefService.init();
  LanguagesScreenController.selectedLanguage =
      prefService.getString(key: 'languageCode') ??
          "ar";
          // Platform.localeName.split('_')[0];
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    runApp(
      const RestartWidget(
        child: MyApp(),
      ),
    );
  });
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  State<RestartWidget> createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
