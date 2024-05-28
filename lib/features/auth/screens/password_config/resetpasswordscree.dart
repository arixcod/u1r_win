import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';
import 'package:u1r/utils/constatnts/sizes.dart';


class ResetpasswordScreen extends StatelessWidget {
  const ResetpasswordScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
              Get.back();
          }, icon:const Icon(CupertinoIcons.clear))
        ],
      ), body: Padding(padding: 
       const  EdgeInsets.all(Tsizes.defaultspacing),
         child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //Image 


             Image(image: AssetImage(TImages.deliveredinEmailillustration),width:THelperFunctions.screenWidth() *0.6,),

          //   TImages.staticsuccesillustrion, Ttile & subtitle  
      
      const SizedBox(height: Tsizes.spacebtwnsection,),
      
      
              //Headings
                Text("Password reset Email Sent",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
                const SizedBox(height: Tsizes.spacebtwnitems,),
                Text("To reset your password please eneter the email id linked to your account , e.g user@gmail.com." ,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
                const SizedBox(height: Tsizes.spacebtwnsection*2,),

      //buttons

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){}, child: Text('Continue',style: Theme.of(context).textTheme.titleMedium,))),
              
      
            //TextField
               const SizedBox(height: Tsizes.spacebtwnitems,),
              

                    SizedBox(
                      width: double.infinity,
                      child: TextButton(onPressed: (){
                          }, child: Text('Resend Email',style: Theme.of(context).textTheme.titleMedium,))),
                        const SizedBox(height: Tsizes.spacebtwnitems,),
             
          ],
         ),
      ),
    );
  }
}