import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:u1r/data/repos/auth_repo.dart';
import 'package:u1r/data/repos/user_data_save.dart';
import 'package:u1r/features/models/user_model.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';
import 'package:u1r/utils/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:u1r/utils/snackbars/customsnackbar.dart';

class SignupController extends GetxController {
  //getX instance
  static SignupController get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  final deviceStorage = GetStorage();

  GlobalKey<FormState> singupformKey =
      GlobalKey<FormState>(); //form key for form validation
  //variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final gst = TextEditingController();
  final adressLine1 = TextEditingController();
  final landmark = TextEditingController();
  final pincode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();

  Future<void> signup() async {
    try {
      TfullScreenloader.openLoadingDialouge(
          'Wait ,we are setting Up things for You', TImages.registeringuser);
      if (!singupformKey.currentState!.validate()) {
        TfullScreenloader.stopLoading();
        return;
      }

      ///here we write the code for uploading data for the current user
      ///Save data in user model

      final newUser = UserModel(
          id: _auth.currentUser!.uid,
          first: firstName.text.trim(),
          last: lastName.text.trim(),
          email: email.text.trim(),
          gstNumber: gst.text.trim(),
          adress: adressLine1.text.trim(),
          landmark: landmark.text.trim(),
          pincode: pincode.text.trim(),
          city: city.text.trim(),
          state: state.text.trim());

      final userRepo = Get.put(UserRepo());
      await userRepo.saveuserRecord(newUser);

      //saving state of the signup screen in the local storage

      deviceStorage.writeIfNull('FirebaseUserdataLoaded', true);

      //show succes snackbar

      TcustomSnackbar.succesSnackbar(
          title: "Congrats!", message: 'You are all set');

      // Move to relevant screen decide by screenRedirect Function home if success
      Get.put(Authrepo().screenRedirect());
      //Get.offAll(()=>const NavigationMenu());

      //Get user data
    } catch (err) {
      TcustomSnackbar.errorSnackbar(
          title: "Oops !", message: 'Something Went Wrong');
    }
  }
}
