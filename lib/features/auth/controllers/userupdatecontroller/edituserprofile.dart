
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:u1r/data/repos/auth_repo.dart';
import 'package:u1r/data/repos/user_data_save.dart';
import 'package:u1r/features/auth/controllers/user_profile_controller.dart';
import 'package:u1r/features/models/user_model.dart';
import 'package:u1r/features/personilaztion/Screens/userprofileScreen.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';
import 'package:u1r/utils/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:u1r/utils/snackbars/customsnackbar.dart';

class ChangeNameController extends GetxController{
 
  //getX instance
  
  static  ChangeNameController get instance=>Get.find();

  final firstName=TextEditingController();
  final lastName=TextEditingController();
  final email=TextEditingController(); 
  final gst=TextEditingController();
  final addres=TextEditingController(); 
  

  final userController=UserProfileController.instance; 
  //repo
  final userRepository=Get.put(UserRepo());
  GlobalKey <FormState> updateUserNameFormKey=GlobalKey<FormState>();
  
  //form key for form validation
  
  //variables 
  
  
@override
void onInit(){
  initialieNames();
  super.onInit();
}

//Fetch User record

Future<void>initialieNames() async{

    firstName.text=userController.user.value.first;

    lastName.text=userController.user.value.last;
email.text=userController.user.value.email;
addres.text=userController.user.value.adress;
gst.text=userController.user.value.gstNumber;

}

Future<void> updateusername() async{
try{

      TfullScreenloader.openLoadingDialouge('Wait ,Changinging Your Name', TImages.registeringuser);
     
      if(!updateUserNameFormKey.currentState!.validate()){
          TfullScreenloader.stopLoading();
          return ;
    }


///here we write the code for uploading data for the current user
///Save data in user model


Map<String ,dynamic>name={
      'first': firstName.text.trim(),
      'last': lastName.text.trim(),
      'email': email.text.trim(),
      'gstNumber': gst.text.trim(),
      'adress': addres.text.trim(),      
};

  final userRepo=Get.put(UserRepo());
  await userRepo.updateSingleuserfield(name);

  //update the fields


   userController.user.value.first=firstName.text.trim();
   userController.user.value.last=lastName.text.trim(); 
    userController.user.value.email=email.text.trim();  
    userController.user.value.adress=addres.text.trim(); 
    userController.user.value.gstNumber=gst.text.trim(); 
   TfullScreenloader.stopLoading();


  //show succes snackbar

  TcustomSnackbar.succesSnackbar(title: "Congrats!",message: 'Name Changed');

    // Move to relevant screen decide by screenRedirect Function home if s

    Get.off(
      
      UserprofileScreen(user: userController.user),transition: Transition.fadeIn);
    //Get.offAll(()=>const NavigationMenu());
  
  
  //Get user data

}







catch(err){   
   TcustomSnackbar.errorSnackbar(title: "Oops !",message: 'Something Went Wrong');
  }

}



}


