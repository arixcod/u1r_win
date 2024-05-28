import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:u1r/data/repos/auth_repo.dart';
import 'package:u1r/data/repos/user_data_save.dart';
import 'package:u1r/features/models/user_model.dart';

import '../../../utils/constatnts/colors.dart';

class UserProfileController extends GetxController {
  // create the getX instance
  static UserProfileController get instance => Get.find();

  // variable to hold and preserve the user data for the app session
  Rx<UserModel> user = UserModel.empty().obs;

  //firebase instance

  final _auth = FirebaseAuth.instance;
  final deviceStorage = GetStorage();

  // getting the user Repository instance
  final _userRepo = Get.put(UserRepo());

  //creating the observable variable
  final isloading = false.obs;
  @override
  onInit() {
    super.onInit();
    getAllprofiledata();
  }

  Future<void> getAllprofiledata() async {
    try {
      // Start the loader
      isloading.value = true;
      final userData = await _userRepo.fetcheuserRecord();
      this.user(userData);
      //Assign the user data to variable
    } catch (err) {
      user(UserModel.empty());
    } finally {
      isloading.value = false;
    }
  }

//delete account warning

  void getdefaultdailouge() {
    Get.defaultDialog(
        contentPadding:const EdgeInsets.all(10),
        title: "Delete Account ?",
        middleText: 'Are you sure you want to delete your account ?',
        confirm: OutlinedButton(
          style:      ElevatedButton.styleFrom(
                            side: BorderSide(color: Tcolors.warning)
                          ),
            onPressed: () async {
              //    await deleteuseraccount();
            },
            child: Text('delete',style: TextStyle(color: Tcolors.warning),)),
             cancel: OutlinedButton(
            style: ElevatedButton.styleFrom(
                            side: BorderSide(color: Tcolors.primaryColorbtnshade)
                          ),
            onPressed: () async {
              Navigator.of(Get.overlayContext!).pop();
            },
            child: Text('cancel',style: TextStyle(color: Tcolors.primaryColorbtnshade)),
            
            ));
  }


void deleteuser()async{
    
    //firstly reauthincate the user to delete
    try{

     final auth=Authrepo.instance;
     final provider=auth.authUser!.providerData.map((e) => e.providerId).first;

      if(provider.isNotEmpty){

        if(provider=='Phone'){
        
          // users needs to be recently signedIn for the deletion process 
            
        }
     }   


    }catch(e){


    }



}
}
