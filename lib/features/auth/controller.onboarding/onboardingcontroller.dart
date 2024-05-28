import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:u1r/features/auth/screens/login/login.dart';

class OnBoardingController extends GetxController{


static OnBoardingController get instance=>Get.find();


//variable

final pageController =PageController();
Rx<int> currentPageIndex=0.obs;  
void updatePageIndicator(index)=>currentPageIndex.value=index;


void dotNavigator(index){
  currentPageIndex.value=index;
  pageController.jumpTo(index);
}


void nextPage(){

  if(currentPageIndex.value==2){
      final getStorage=GetStorage();
      getStorage.write("isFistTime",false);
       Get.offAll( LoginScreen());

  }
  else{
    int page=currentPageIndex.value+1;
    pageController.jumpToPage(page);
  }


}

  void skipPage(){
              currentPageIndex.value=2;
             pageController.jumpToPage(2);
  }
}