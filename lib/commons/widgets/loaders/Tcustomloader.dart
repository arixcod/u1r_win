import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/colors.dart';

class Tcustomloaders {
  static hidesnackbar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        width: 250,
        
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.transparent,
        content: Container(
          width: 100,
         margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: THelperFunctions.isDarkMode(Get.context!)
                  ? Tcolors.darkergrey.withOpacity(0.9)
                  : Tcolors.grey.withOpacity(0.9)),
          child: Center(
            child: Text(
            message,
            style: Theme.of(Get.context!).textTheme.labelLarge,
          )),
        )));
  }



  Tcustomscreenloader(){
            
           
           ModalProgressHUD(
            inAsyncCall: true,
            child: 
             Center(
               child: CircularProgressIndicator(
                      color:Tcolors.accent ,
                      strokeWidth: 4.0,),
             )
         



            );  
  }
}
