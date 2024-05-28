import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:u1r/data/repos/auth_repo.dart';
import 'package:u1r/features/auth/screens/login/login.dart';

class loginController extends GetxController {
  final TextEditingController textinput = TextEditingController();
  final localstorage = GetStorage();
  GlobalKey<FormState> loginFormkey = GlobalKey<FormState>();
  final authrepo = Get.put(Authrepo());
  static loginController get instance => Get.find();
  Rx<int> current_timer = 90.obs;
   RxBool showSpinner=false.obs;
 
  void logoutuser() {
    try {
      authrepo.logoutuser();

      Get.offAll(LoginScreen());
    } catch (err) {
      rethrow;
    }
  }

  void login() async{
    try {

      // start the loader here
    
      showSpinner.value=true;

        //validate the form
        if (!loginFormkey.currentState!.validate()) {
        return;
      }
      //
     print("this is the nnumber:${textinput.text}") ;
     await authrepo.loginuserwithotp(textinput.text.toString().trim());

    } catch (err) {
    } finally {

    showSpinner.value=false;
    }
  }

  void startTimer() {
    const interval_timer = Duration(seconds: 1);

     Timer.periodic(interval_timer, (timer) {
      if (current_timer.value == 0) {
        timer.cancel();
      } else
        () {
          current_timer.value--;
        };
    });
  }
}
