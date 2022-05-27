import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/localization/localization_service.dart';
import 'package:news_app/splash%20screen/ui/screen_Splash.dart';
import 'Auth_Module/ui/screen/login.dart';
import 'Helpers/colors.dart';
import 'generated/l10n.dart';
import 'hive/hive.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await HiveSetUp.init();
  runApp( MyApp());

}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LanguageHelper preferencesHelper ;

 late LocalizationService _localizationService ;
 late String lang ='en';
  // This widget is the root of your application.

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News app',
      locale: Locale.fromSubtags(
        languageCode:lang,
      ),
      onGenerateTitle: (BuildContext context)=>S.of(context).Popular,

      localizationsDelegates: [
        S.delegate,
       GlobalMaterialLocalizations.delegate,
       GlobalCupertinoLocalizations.delegate,
       GlobalWidgetsLocalizations.delegate,


      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        primarySwatch: customColor
      ),
      home: SplashScreen()
    );
  }

  @override
  void initState() {
    super.initState();
   _localizationService =LocalizationService();
   lang = _localizationService.getLanguage();
    _localizationService.localizationStream.listen((event) {
      lang = event;
      setState(() {

      });
    });
  }
}

