import 'package:flutter/material.dart';

MaterialColor primary = MaterialColor(
  400,
  {
    // Tea
    200: const Color.fromARGB(40, 57, 181, 74),
    300: const Color.fromARGB(67, 57, 181, 74),
    // Green
    400: const Color.fromARGB(255, 57, 181, 74),
    500: const Color.fromARGB(255, 34, 120, 44)
  }
);

MaterialColor error = MaterialColor(
    400,
    {
    // Red glass
    200: const Color.fromARGB(40, 244, 31, 31),
    300: const Color.fromARGB(67, 244, 31, 31),
    // Red
    400: const Color.fromARGB(255, 244, 31, 31),
    500: const Color.fromARGB(255, 178, 26, 26)
    }
);

MaterialColor grays = MaterialColor(
  400,
  {
    200: const Color.fromARGB(255, 234, 234, 234),
    300: const Color.fromARGB(255, 137, 154, 170),
    400: const Color.fromARGB(255, 86, 100, 114),
    500: const Color.fromARGB(255, 54, 64, 76)
  }
);

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity.comfortable,

  primaryColor: primary[400],
  primaryColorDark: primary[500],
  primaryColorBrightness: Brightness.light,
  accentColor: primary[200],
  
  errorColor: error[400],
  accentColorBrightness: Brightness.light,
  
  backgroundColor: grays[200],
  canvasColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  dividerColor: grays[200],
  colorScheme: ColorScheme(
    primary: primary[400], 
    primaryVariant: primary[500], 
    secondary: primary[200], 
    secondaryVariant: primary[300],
    surface: grays[200], 
    background: Colors.white, 
    error: error[200], 
    onPrimary: Colors.white, 
    onSecondary: primary[400], 
    onSurface: grays[500], 
    onBackground: grays[500], 
    onError: error[400], 
    brightness: Brightness.light
  ),

  unselectedWidgetColor: grays[400],
  dividerTheme: DividerThemeData(
    color: grays[300]
  ),
  disabledColor: grays[200],


  fontFamily: 'Rubik',
  textTheme: TextTheme(
    headline1: TextStyle(color: grays[500], fontFamily: 'Rubik', fontWeight: FontWeight.w500, fontSize: 20.0),
    headline2: TextStyle(color: grays[500], fontFamily: 'Rubik', fontWeight: FontWeight.w500, fontSize: 16.0),
    headline3: TextStyle(color: grays[500], fontFamily: 'Rubik', fontWeight: FontWeight.w500, fontSize: 14.0),
    
    subtitle1: TextStyle(color: grays[300], fontFamily: 'Rubik', fontWeight: FontWeight.w400, fontSize: 18.0),
    subtitle2: TextStyle(color: grays[300], fontFamily: 'Rubik', fontWeight: FontWeight.w400, fontSize: 14.0),

    bodyText1: TextStyle(color: grays[400], fontFamily: 'Rubik', fontSize: 14.0, fontWeight: FontWeight.w400, height: 1.5),
    button: TextStyle(color: Colors.white, fontFamily: 'Rubik', fontWeight: FontWeight.w500, fontSize: 16.0)
  ),

  accentTextTheme: TextTheme(
    headline1: TextStyle(color: primary[400], fontFamily: 'Rubik', fontWeight: FontWeight.w500, fontSize: 20.0),
    headline2: TextStyle(color: primary[400], fontFamily: 'Rubik', fontWeight: FontWeight.w500, fontSize: 16.0),
    headline3: TextStyle(color: primary[400], fontFamily: 'Rubik', fontWeight: FontWeight.w500, fontSize: 14.0),
    
    subtitle1: TextStyle(color: primary[400], fontFamily: 'Rubik', fontWeight: FontWeight.w400, fontSize: 18.0),
    subtitle2: TextStyle(color: primary[400], fontFamily: 'Rubik', fontWeight: FontWeight.w400, fontSize: 14.0),

    bodyText1: TextStyle(color: primary[400], fontFamily: 'Rubik', fontSize: 14.0),
    button: TextStyle(color: primary[400], fontFamily: 'Rubik', fontWeight: FontWeight.w500, fontSize: 16.0)
  ),

  buttonTheme: ButtonThemeData(
    padding: EdgeInsets.only(left: 16, right: 16),
    height: 44
  ),

  // Disable splash effects
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  

  appBarTheme: AppBarTheme(elevation: 0, color: Colors.white, textTheme: TextTheme(headline6: TextStyle(color: grays[500], fontFamily: 'Rubik', fontWeight: FontWeight.w500, fontSize: 18.0)))
);