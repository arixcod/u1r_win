


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/utils/constatnts/colors.dart';

class TcustomSnackbar {



static succesSnackbar({required title,message=''}){
    
    Get.snackbar(
      title, message,
      shouldIconPulse: true,
      colorText: Tcolors.white,
      backgroundColor: Tcolors.primaryColor,
      snackPosition: SnackPosition.BOTTOM,
      duration:const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      isDismissible: true,
      icon: const Icon(Iconsax.check,color: Tcolors.white,)

    
    );

  }


  static warningSnackbar({required title,message=''}){
    Get.snackbar(
      
      title, message,
      shouldIconPulse: true,
      colorText: Tcolors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration:const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      isDismissible: true,
      icon: const Icon(Iconsax.warning_2,color: Tcolors.white,)

    
    );

  }

 static errorSnackbar({required title,message=''}){
    Get.snackbar(
      
      title, message,
      shouldIconPulse: true,
      colorText: Tcolors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration:const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      isDismissible: true,
      icon: const Icon(Iconsax.warning_2,color: Tcolors.white,)

    
    );


  }
}