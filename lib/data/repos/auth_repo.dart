import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:u1r/commons/widgets/loaders/Tcustomloader.dart';
import 'package:u1r/data/repos/user_data_save.dart';
import 'package:u1r/features/auth/screens/login/login.dart';
import 'package:u1r/features/auth/screens/onboarding/onboarding.dart';
import 'package:u1r/features/auth/screens/signup/signup.dart';
import 'package:u1r/local_storage/storage_utility.dart';
import 'package:u1r/navigation_menu.dart';

import '../../features/auth/screens/login/otp_verification.dart';

class Authrepo extends GetxController {
  static Authrepo get instance => Get.find();

  final userreporfordata = Get.put(UserRepo());

  //gettting firebase data
  final _auth = FirebaseAuth.instance;
  //variables
  final deviceStorage = GetStorage();
  //called from main.dar

  // to only fetch the firebase user data

  //get the authinticated user

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  Future<void> loginuserwithotp(String phone) async {
    Get.defaultDialog(
          title: '',
          onWillPop: () async {
            return false;
          },
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: const CircularProgressIndicator());
         
      await _auth.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException error) {},
        codeSent: (String verificationId, int? resendToken) {
         

      //  Get.defaultDialog(
      //     title: '',
      //     onWillPop: () async {
      //       return false;
      //     },
      //     barrierDismissible: false,
      //     backgroundColor: Colors.transparent,
      //     content: const CircularProgressIndicator());
         
          Get.to(() => OTPVerifyScreen(
                verificationId: verificationId,
              ));

    //Get.back();

        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: '+91' + phone);
  }

  // logout the user

  Future<void> logoutuser() async {
    await _auth.signOut();
  }

  screenRedirect() async {
  
  
    //  get the  user

    final user = _auth.currentUser;

    // get the userdata

    if (user != null) {
      //initialize the user specific bucket

      await TLocalStorage.init(user.uid);

      if (deviceStorage.read('FirebaseUserdataLoaded') != true) {
        final userdata = await userreporfordata.fetcheuserRecord();

        // Get.offAll(() => const SignUpScreen());
        //this below code checks if there is data in the firebase

        if (userdata.first != '') {
          Get.offAll(() =>  NavigationMenu());
        } else {
          Get.offAll(() => const SignUpScreen());
        }
      } else {
        Get.offAll(() =>  NavigationMenu());
      }
    } else {
      deviceStorage.writeIfNull('isFistTime', true);
      deviceStorage.read('isFistTime') != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(() => const OnBoardingscreen());
    }
  }
}
