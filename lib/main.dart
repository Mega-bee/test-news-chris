import 'package:flutter/material.dart';
import 'package:news_app/splash%20screen/ui/screen_Splash.dart';

import 'Auth_Module/ui/screen/login.dart';
import 'Helpers/colors.dart';
import 'hive/hive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveSetUp.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News app',
      theme: ThemeData(
        primarySwatch: customColor
      ),
      home: SplashScreen()
    );
  }
}

