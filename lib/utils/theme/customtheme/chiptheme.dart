import 'package:flutter/material.dart';



class TchipTheme{
//   creating the  Constructor private

  TchipTheme._();
  static ChipThemeData lightchiptheme=ChipThemeData(
    disabledColor: Colors.grey.withOpacity(.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
    checkmarkColor:  Colors.white,
  );

static ChipThemeData darkchiptheme=const ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle:  TextStyle(color: Colors.white),
    selectedColor: Colors.blue,
    padding:  EdgeInsets.symmetric(horizontal: 12,vertical: 12),
    checkmarkColor:  Colors.white,
  );
  

}