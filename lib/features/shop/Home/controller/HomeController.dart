import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final carouselControlleindexr = 0.obs;
  static HomeController get instance => Get.find();
  final GlobalKey<ScaffoldState> drawerglabalkey = GlobalKey();

  // Create a key

  final RxBool ishometitleactive = true.obs;

  //to create the global instance when app is loaded below controller and their vairable will  be created

  @override
  void dispose() {
    // cartcontroller.saveCartToFirebase();
    super.dispose();
  }

  void togglehome() {
    if (ishometitleactive == true) {
      ishometitleactive.value = false;
    } else {
      ishometitleactive.value = true;
    }
  }

  void Hammenu() {
    drawerglabalkey.currentState!.openDrawer();
  }

  void closeHame() {
    drawerglabalkey.currentState!.closeDrawer();
  }

  void updatePageIndicator(index) {
    carouselControlleindexr.value = index;
  }
}
