import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/commons/widgets/loaders/animation_loader.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/colors.dart';


class TfullScreenloader{


  static void openLoadingDialouge(String text,String animation){

    showDialog( 
      context:Get.overlayContext!,
      barrierDismissible: false,
     builder:(_)=>WillPopScope(
      onWillPop: () async{return false ; },
      child:Container(
        color: THelperFunctions.isDarkMode(Get.context!)?Tcolors.dark:Tcolors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 250,),
            TAnimationLoaderWidget(text: text, animation: animation, )
          ],
        ),
      ),


      
     )
     
     
     
     );

  }


static stopLoading(){
  Navigator.of(Get.overlayContext!).pop();
}

}