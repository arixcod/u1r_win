
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/features/auth/controllers/countdowntimercontroller.dart';
import 'package:u1r/features/auth/controllers/otp_controller.dart/otp_verify.dart';
import 'package:u1r/features/auth/screens/login/login.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';


class OTPVerifyScreen extends StatelessWidget {

  String verificationId;
   OTPVerifyScreen({super.key,required this.verificationId});

  @override
  Widget build(BuildContext context) {

    final otpfieldveryficontroller=Get.put(OTPVerifyController());  
    final controller= Get.put(CountdownTimer());
     final dark=THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.only(
          top:    Tsizes.appbarHieght,
          left:   Tsizes.defaultspacing,
          right:  Tsizes.defaultspacing,
          bottom:  Tsizes.defaultspacing,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                     Image(
                      height: THelperFunctions.screenHeight()*0.1,
                      image:AssetImage(TImages.darkApplogo)),
                      const SizedBox(height: Tsizes.spacebtwnsection,),
                   
                ],
              ),

           //form field for the OTP  screen
          
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.symmetric(horizontal:15),

               child: Text("Enter the OTP Recieved ",style: Theme.of(context).textTheme.titleMedium,),
             ),

             TextButton(onPressed: (){
              Get.to(LoginScreen());
             }, child: Text("Change ? 9651639808 ",style: Theme.of(context).textTheme.titleMedium!.apply(
              color: Tcolors.error,
              decoration: TextDecoration.underline
             ),)),
          
           Form(
            key: otpfieldveryficontroller.OTPFORMkey, 

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:Tsizes.spacebtwnitems),
              child: Column(
                      children: [ 
                      Row(
                        children: [
                          otpBoxes(textinput: otpfieldveryficontroller.textfiel1,),               
                          otpBoxes(textinput: otpfieldveryficontroller.textfiel2),
                          otpBoxes(textinput: otpfieldveryficontroller.textfiel3),
                          otpBoxes(textinput: otpfieldveryficontroller.textfiel4),
                          otpBoxes(textinput: otpfieldveryficontroller.textfiel5),
                          otpBoxes(textinput: otpfieldveryficontroller.textfiel6), 
                          ],
                      ),  
                      
                        const SizedBox(height: Tsizes.spacebtwInputField,),                    
                        const SizedBox(height: Tsizes.spacebtwInputField/2,),
            
            
                    const SizedBox(height: Tsizes.spacebtwnitems,),
            
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        
                        onPressed: () async{

                              // here controller will be attached to the UI/UX
                              otpfieldveryficontroller.OTPVerify(verificationId);
                          //     //  try{
                            PhoneAuthCredential credential= PhoneAuthProvider.credential(verificationId: verificationId, smsCode: '');
                          //     //   await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
                          //     //     Get.offAll(const HomeScreen());
                          //     //   });
                          //     } 
                          //  catch(err){
                          //   print(err);
                          //  }
                         

                      }, child: Text('Verify OTP',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Tcolors.white),))),
                        const SizedBox(height: Tsizes.spacebtwnitems,),
             
                   
                       ],
                      ),
                )
          
          ),
           ],
         ),
          

          // Divider
         
          // Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Flexible(child: Divider(color:dark? Tcolors.darkgrey:Tcolors.grey,thickness: 0.5,indent: 60,endIndent: 5,))
          //         ,Text('Or Sign In With',style: Theme.of(context).textTheme.labelMedium,)
          //     ,  Flexible(child: Divider(color:dark? Tcolors.darkgrey:Tcolors.grey,thickness: 0.5,indent: 5,endIndent:60,))
                
          //       ],
          
          // ),
          //Footer
                        Obx(
                          ()=> Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text.rich(TextSpan(children: [
                            TextSpan(text:'Didnt Recieve OTP? Resend After ',style: Theme.of(context).textTheme.labelLarge),
                                                  
                              TextSpan(text:'${controller.time.value} ' ,style: Theme.of(context).textTheme.titleMedium!.apply(
                              color: dark?Colors.white:Tcolors.warning,
                              decorationColor: dark?Colors.white:Tcolors.primaryColor,
                            )),
                                                  
                            TextSpan(text:'Seconds.',style: Theme.of(context).textTheme.labelMedium),
                                               
                            
                                                ])
                                                ),
                          ),
                        ),

            const SizedBox(height: Tsizes.spacebtwnsection,),
            
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       decoration: BoxDecoration(border: Border.all(color:Tcolors.grey),borderRadius: BorderRadius.circular(100)),
          //       child: IconButton(
          //         onPressed: (){},
          //         icon: const Image(
          //           width: Tsizes.iconmd,
          //           height: Tsizes.iconmd,
          //           image: AssetImage(TImages.google))),
          //     ),
          //      const SizedBox(width: Tsizes.spacebtwnsection,),
            
          //     Container(
          //       decoration: BoxDecoration(border: Border.all(color:Tcolors.grey),borderRadius: BorderRadius.circular(100)),
          //       child: IconButton(
          //         onPressed: (){},
          //         icon: const Image(
          //           width: Tsizes.iconmd,
          //           height: Tsizes.iconmd,
          //           image: AssetImage(TImages.facebook))),
          //     )
          //   ],
          // )

            ],
          ),

  

          ),
      ),
 
    );
    
    
     

     }
    
     
     
     
     }

class otpBoxes extends StatelessWidget {

  final TextEditingController textinput;
  const otpBoxes({super.key,required this.textinput});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
                            width: 46,
                            height: 50,
                            child: TextFormField(
                              controller: textinput,
                              autofocus: true,
                              onSaved:(pin1) {
                              } ,
                              onChanged: (value){
                                if(value.length==1){
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                              counterText: "",
                                
                              ),
                            ),
    
                          ),
    );
 }
}


