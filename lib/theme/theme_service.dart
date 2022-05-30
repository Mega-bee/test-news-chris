import 'package:flutter/material.dart';
import 'package:news_app/hive/hive.dart';
import 'package:rxdart/rxdart.dart';

import '../Helpers/colors.dart';


class AppThemeDataService {
  static final PublishSubject<ThemeData> _darkModeSubject =
      PublishSubject<ThemeData>();

  Stream<ThemeData> get darkModeStream => _darkModeSubject.stream;

   ThemeHelper _themeHelper =ThemeHelper();

  static Color get PrimColor {
    return PrimaryColor;
  }

  ThemeData getActiveTheme() {
    var dark = _themeHelper.getisDark();
    final lightScheme = ColorScheme.fromSeed(seedColor:PrimaryColor,

    );
    final darkScheme = ColorScheme.fromSeed(
        seedColor:Colors.black,
        brightness: Brightness.dark,

        );
    if (dark == true) {

      return ThemeData(
          brightness: Brightness.dark,
          colorScheme: darkScheme,
          useMaterial3: true,
          primarySwatch: Colors.green,
          focusColor: Colors.black,
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(primary: Colors.white70)),
          checkboxTheme: CheckboxThemeData(
            checkColor:
                MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.pressed,
                MaterialState.hovered,
                MaterialState.focused,
              };
              if (states.any(interactiveStates.contains)) {
                return Colors.grey;
              }
              return Colors.white;
            }),
            fillColor:
                MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.pressed,
                MaterialState.hovered,
                MaterialState.focused,
              };
              if (states.any(interactiveStates.contains)) {
                return Colors.black;
              }
              return PrimaryColor;
            }),
          ),

          appBarTheme: AppBarTheme(
            color: Colors.black
          ),
          scaffoldBackgroundColor: ThemeHelper().getisDark() ? Colors.black :PrimaryColor,
          cardColor: Colors.grey[150],
          fontFamily: 'Dubai',
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          )),
          textTheme: TextTheme(
            button: TextStyle(
              color: Colors.white,
            ),
          ));
    }
 
    return ThemeData(
        brightness: Brightness.light,



        //    colorScheme: lightScheme,

       appBarTheme: AppBarTheme(

         color: PrimColor
       ),
        primaryColor: PrimColor,
        backgroundColor: Color.fromRGBO(236, 239, 241, 1),
        textTheme: TextTheme(button: TextStyle(color: Colors.white)),
        fontFamily: 'Dubai',
        timePickerTheme: TimePickerThemeData(
          dialBackgroundColor: Color.fromRGBO(235, 235, 235, 1),
          dayPeriodBorderSide:
              BorderSide(color: Color.fromRGBO(235, 235, 235, 1)),
        ));
  }

  void switchDarkMode(bool darkMode) async {
    if (darkMode) {
      _themeHelper.setTheme(true);
    } else {
      _themeHelper.setTheme(false)
      ;
    }
    var activeTheme = await getActiveTheme();
    _darkModeSubject.add(activeTheme);
  }


  }

