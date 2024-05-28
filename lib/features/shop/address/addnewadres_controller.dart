import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/data/repos/user_data_save.dart';
import 'package:u1r/features/auth/controllers/user_profile_controller.dart';

import 'package:u1r/features/personilaztion/Screens/userprofileScreen.dart';
import 'package:u1r/features/shop/address/address.dart';
import 'package:u1r/features/shop/address/address_repo.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';
import 'package:u1r/utils/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:u1r/utils/snackbars/customsnackbar.dart';

class addadress extends GetxController {
  //getX instance

  static addadress get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final addres = TextEditingController();
  final landmar = TextEditingController();
  final pincode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();

  final userController = UserProfileController.instance;

  final RxBool showspinner = false.obs;
  //repo


  //to redraw the dsign 

  RxBool refreshdata=true.obs;

  final userRepository = Get.put(UserRepo());
  GlobalKey<FormState> addadresskey = GlobalKey<FormState>();

  //form key for form validation

  //variables
  final _auth = FirebaseAuth.instance;
  @override
  void onInit() {
    initialieNames();
    super.onInit();
  }

//Fetch User record

  Future<void> initialieNames() async {
    firstName.text = userController.user.value.first;
    lastName.text = userController.user.value.last;
    email.text = userController.user.value.email;
  }

  addaddress() async {
    try {
      showspinner.value = true;

      if (!addadresskey.currentState!.validate()) {
        showspinner.value = false;
        return;
      }

      final currentuser = _auth.currentUser!.phoneNumber;

      ///here we write the code for uploading data for the current user
      ///Save data in user model

      Map<String, dynamic> adressss = {
        'name': firstName.text.trim() + ' ' + lastName.text.trim(),
        'email': email.text.trim(),
        'adress': addres.text.trim(),
        'landmark': landmar.text.trim(),
        'pincode': pincode.text.trim(),
        'city': city.text.trim(),
        'State': state.text.trim(),
        'MobileNo': currentuser,
        'isPrimary': false
      };

      final adrerepo = Get.put(AddressRepository());
      await adrerepo.addadress(adressss);

      //update the fields

      refreshdata.toggle();
      showspinner.value = false;

      //show succes snackbar

      TcustomSnackbar.succesSnackbar(title: "Congrats!", message: 'Added !');

      // Move to relevant screen decide by screenRedirect Function home if s
     
      Get.toEnd(() => Addresscreen());

      //Get.offAll(()=>const NavigationMenu());

      //Get user data
    } catch (err) {
      TcustomSnackbar.errorSnackbar(
          title: "Oops !", message: 'Something Went Wrong');
    }
  }
}
