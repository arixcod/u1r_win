import 'package:flutter/material.dart';



class Tcolors{
  Tcolors._();

  //App Basic Colors
  static const Color primaryColor=Color.fromARGB(255, 77, 164, 50) ;
  static const Color secondary=Color(0XFFFFE24B);
  static const Color accent=Color(0XFFb0c7ff);


  //basic app primary color shade for buttons

  static const Color primaryColorbtnshade=Color.fromARGB(255, 48, 111, 29);

  ///Text Color
  

  static const Color textprimaryColor=Color(0XFF333333);
  static const Color textsecondary=Color(0XFF6C757D);
  static const Color textaccent=Colors.white;

  //Background Colors

  static const Color light =Color(0XFFF6F6F6);
  static const Color dark=Color(0XFF272727);
  static const Color primaryBackground=Color(0XFFF3F5FF);


//Background Container Colors

  static const Color lightcontainer =Color(0XFFF6F6F6);
  static  Color darkcontainer=Tcolors.white.withOpacity(0.1);
  
  //Button Colors

   static const Color buttonprimaryColor=Color(0XFF4b68ff);
  static const Color buttonsecondary=Color(0XFF6C757D);
  static const Color buttondisabled=Color(0XFFC4C4C4);

//Border Colors

  static const Color borderprimaryColor=Color(0XFFD9D9D9);
  static const Color bordersecondary=Color(0XFFE6E6E6);


  //Error & Validation colors

  static const Color error=Color(0XFFD32F2F);
  static const Color success=Color(0XFF388E3C);

  static const Color warning=Color(0XFFF57C00);

  static const Color info=Color(0XFF1976D2);


  // Nuetral Shades

  static const Color blck=Color(0XFF232323);
  static const Color darkergrey=Color(0XFF4F4F4F);
  static const Color darkgrey=Color(0XFF939393);
  static const Color grey=Color(0XFFE0E0E0);
  static const Color softkgrey=Color(0XFFF4F4F4);
  static const Color lightgrey=Color(0XFFF9F9F9);
  static const Color white=Color(0XFFFFFFFF);


  //Gradient Colors

  static const Gradient lineargradient=LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0Xffff9a9e),
      Color(0Xffffad0c4),
      Color(0Xffffad0c4),
      
    
  ]);



}