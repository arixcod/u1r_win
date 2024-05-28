import 'package:flutter/material.dart';



class ToutlinedButtonTheme{
//   creating the  Constructor private

  ToutlinedButtonTheme._();
  
  //--light Theme
  static final ligthoutlinedButtonTheme=OutlinedButtonThemeData(
    
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
      textStyle:const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
    ));

    //- Dark Theme

  static final darkhoutlinedButtonTheme=OutlinedButtonThemeData(
    
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
      textStyle:const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
    ));
  }