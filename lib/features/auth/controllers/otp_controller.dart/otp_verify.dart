import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/data/repos/auth_repo.dart';
import 'package:u1r/features/shop/Home/widget/home.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';
import 'package:u1r/utils/loader.dart';
import 'package:u1r/utils/snackbars/customsnackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPVerifyController extends GetxController {
  static OTPVerifyController get instance => Get.find();

  //variables
  final textfiel1 = TextEditingController();
  final textfiel2 = TextEditingController();
  final textfiel3 = TextEditingController();
  final textfiel4 = TextEditingController();
  final textfiel5 = TextEditingController();
  final textfiel6 = TextEditingController();

  GlobalKey<FormState> OTPFORMkey =
      GlobalKey<FormState>(); //form key for form validation

// Signup function here
  Future<void> OTPVerify(String verificationId) async {
    try {
      //loader start here
      TfullScreenloader.openLoadingDialouge(
          'Verifying OTP', TImages.dockerAnimation);

      //checking the Internet connectivity
      //final isConnected=NetworkManager.instance.isconnected();
//form Validation

      if (!OTPFORMkey.currentState!.validate()) {
        return;
      }
      String smscode = textfiel1.text +
          textfiel2.text +
          textfiel3.text +
          textfiel4.text +
          textfiel5.text +
          textfiel6.text;
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smscode);
          await FirebaseAuth.instance
               .signInWithCredential(credential)
               .then((value) {
        
               Authrepo.instance.screenRedirect();   
                
        //       Get.to(()=>HomeScreen());
      });
    } catch (err) {
      TcustomSnackbar.errorSnackbar(
          title: 'Oh snap', message: "OTP didn't match");
    } finally {
      TfullScreenloader.stopLoading();
    }
  }
}
