import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/features/auth/screens/login/login.dart';
import 'package:u1r/features/auth/screens/signup/verification_success.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';
import 'package:u1r/utils/constatnts/sizes.dart';


class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            Get.offAll(()=> LoginScreen());
          }, icon:const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding:const EdgeInsets.all(Tsizes.defaultspacing),
        child: Column(children: [
          //image
          Image(image:const AssetImage(TImages.deliveredinEmailillustration,),width:THelperFunctions.screenWidth() *0.6,)

          // Ttile & subtitle
      ,  Text('Verify Your Email Address',style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
      const SizedBox(height: Tsizes.spacebtwnitems,),
      Text('anandmishra8009@gmail.com',style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
      const SizedBox(height: Tsizes.spacebtwnitems,),
      Text('verify your email address right now !to enjoy the benefits of our seamless services',style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
      
      const SizedBox(height: Tsizes.spacebtwnsection,),
      
      //buttons

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){
                          Get.to(VerifySuceesScreen(
                            onPressed: () {
                              Get.to(()=>LoginScreen());
                            },
                            image: TImages.staticsuccesillustrion,title:"Account Created Succesfully !" ,subtitle: "Your account with email anandmishra8009@gmail.com has been created Succesfully",));
                      }, child: Text('Continue',style: Theme.of(context).textTheme.titleMedium,))),
                        const SizedBox(height: Tsizes.spacebtwnitems,),
                       const SizedBox(height: Tsizes.spacebtwnsection,),
     
                  SizedBox(
                      width: double.infinity,
                      child: TextButton(onPressed: (){}, child: Text('Resend Email',style: Theme.of(context).textTheme.titleSmall,))),
                        const SizedBox(height: Tsizes.spacebtwnitems,),
         
        ],),),
      ),
    );
  }
}