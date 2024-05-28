import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:u1r/features/auth/screens/password_config/resetpasswordscree.dart';
import 'package:u1r/utils/constatnts/sizes.dart';


class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(padding: 
       const  EdgeInsets.all(Tsizes.defaultspacing),
         child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              //Headings
                Text("Forgot Password",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
                const SizedBox(height: Tsizes.spacebtwnitems,),
                Text("To reset your password please eneter the email id linked to your account , e.g user@gmail.com." ,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
                const SizedBox(height: Tsizes.spacebtwnsection*2,),

            //TextField
                          TextFormField(
                                  decoration:const InputDecoration(labelText: 'Enter Your Email',
                                  prefixIcon: Icon(Icons.email),
                                  
                                  
                                )),
               const SizedBox(height: Tsizes.spacebtwnsection,),
              

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){

                          Get.to(ResetpasswordScreen());
                          }, child: Text('Submit',style: Theme.of(context).textTheme.titleMedium,))),
                        const SizedBox(height: Tsizes.spacebtwnitems,),
             
          ],
         ),
      ),
    );
  }
}