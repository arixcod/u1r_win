import 'package:flutter/material.dart';
import 'package:u1r/utils/theme/customtheme/app_bartheme.dart';
import 'package:u1r/utils/theme/customtheme/bottomsheet_theme.dart';
import 'package:u1r/utils/theme/customtheme/checkboxtheme.dart';
import 'package:u1r/utils/theme/customtheme/chiptheme.dart';
import 'package:u1r/utils/theme/customtheme/elevated_button_theme.dart';
import 'package:u1r/utils/theme/customtheme/outlined_buttontheme.dart';
import 'package:u1r/utils/theme/customtheme/textfield_theme.dart';
import 'package:u1r/utils/theme/customtheme/texttheme.dart';

class TAppTheme {
//   creating the  Constructor private

  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTexttheme,
    elevatedButtonTheme: TElevatedButtonTheme.ligthElavatedButtonTheme,
    chipTheme: TchipTheme.lightchiptheme,
    appBarTheme: TAppbarTheme.lightAppbartheme,
    outlinedButtonTheme: ToutlinedButtonTheme.ligthoutlinedButtonTheme,
    inputDecorationTheme: TTextfieldTheme.lightinputdecorationtheme,
    checkboxTheme: Tcheckboxtheme.lightcheckboxthemedata,
    bottomSheetTheme: TbottomsheetTheme.lightbottomsheetTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElavatedButtonTheme,
    chipTheme: TchipTheme.darkchiptheme,
    appBarTheme: TAppbarTheme.darkAppbartheme,
    outlinedButtonTheme: ToutlinedButtonTheme.darkhoutlinedButtonTheme,
    inputDecorationTheme: TTextfieldTheme.darkinputdecorationtheme,
    checkboxTheme: Tcheckboxtheme.darkcheckboxthemedata,
    bottomSheetTheme: TbottomsheetTheme.darkbottomsheetTheme,
  );
}
