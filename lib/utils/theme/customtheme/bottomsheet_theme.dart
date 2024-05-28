import 'package:flutter/material.dart';



class TbottomsheetTheme{
//   creating the  Constructor private

  TbottomsheetTheme._();


  static BottomSheetThemeData lightbottomsheetTheme=BottomSheetThemeData(
    
      showDragHandle: true,
      backgroundColor:Colors.white,
      modalBackgroundColor:Colors.white,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
      );
  


  static BottomSheetThemeData darkbottomsheetTheme=BottomSheetThemeData(
    
    showDragHandle: true,
    backgroundColor:Colors.black,
    modalBackgroundColor:Colors.black,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
      );

}