import 'package:flutter/material.dart';



class Tcheckboxtheme{
//   creating the  Constructor private

  Tcheckboxtheme._();

//cutomizing the light text theme
  static CheckboxThemeData lightcheckboxthemedata=CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if(states.contains(MaterialState.selected)){
        return Colors.white;

      }

      else{
        return Colors.black;
      }
    }),
    fillColor:MaterialStateProperty.resolveWith((states) {
      if(states.contains(MaterialState.selected)){
        return Colors.blue;

      }

      else{
        return Colors.transparent;
      }
    }), 
  );



  static CheckboxThemeData darkcheckboxthemedata=CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if(states.contains(MaterialState.selected)){
        return Colors.white;

      }

      else{
        return Colors.black;
      }
    }),
    fillColor:MaterialStateProperty.resolveWith((states) {
      if(states.contains(MaterialState.selected)){
        return Colors.blue;

      }

      else{
        return Colors.transparent;
      }
    }), 
  );




}
