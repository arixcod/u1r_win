import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:u1r/features/auth/controllers/login/logincontroller.dart';
import 'package:u1r/features/auth/screens/login/otp_verification.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';
import 'package:get/get.dart';
import 'package:u1r/utils/constatnts/text_string.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(loginController());
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Obx(()
      {
        final spinner=controller.showSpinner;
       // print(spinner.value);
        return ModalProgressHUD(
          progressIndicator: Center(child: CircularProgressIndicator(
            color: Tcolors.primaryColor,
          ),),
          inAsyncCall:spinner.value,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: Tsizes.appbarHieght,
                left: Tsizes.defaultspacing,
                right: Tsizes.defaultspacing,
                bottom: Tsizes.defaultspacing,
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                          height: THelperFunctions.screenHeight() * 0.2,
                          image: AssetImage(TImages.darkApplogo)),
                      Text(
                        TTextstring.Logintitle1,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: Tsizes.spacebtwnsection,
                      ),
                    ],
                  ),
        
                  //form field for the OTP  screen
        
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          TTextstring.Loginsubtitletitle1,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      Form(
                          key: controller.loginFormkey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: Tsizes.spacebtwnitems),
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    var length = value!.length;
                                    if (value.isEmpty || length != 10) {
        
                                       return 'Invalid Phone Number';
                                  
                                    }
                                     },
                                  keyboardType: TextInputType.number,
                                  controller: controller.textinput,
                                  maxLength: 10,
                                  decoration: const InputDecoration(
                                      prefix: Text('+91- '),
                                      prefixIcon: Icon(Icons.phone),
                                      labelText: 'Mobile No'),
                                ),
                                const SizedBox(
                                  height: Tsizes.spacebtwInputField,
                                ),
                                const SizedBox(
                                  height: Tsizes.spacebtwInputField / 2,
                                ),
                                const SizedBox(
                                  height: Tsizes.spacebtwnitems,
                                ),
                                SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: () async {
        
                                          //
        
        
                                          controller.login();
                                        },
                                        child: Text(
                                          'Get OTP',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(color: Tcolors.white),
                                        ))),
                                const SizedBox(
                                  height: Tsizes.spacebtwnitems,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
        
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'By Continuing, you agree to our ',
                        style: Theme.of(context).textTheme.labelSmall),
                    TextSpan(
                        text: 'Privacy Policy ',
                        style: Theme.of(context).textTheme.labelSmall!.apply(
                              color: dark ? Colors.white : Tcolors.primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  dark ? Colors.white : Tcolors.primaryColor,
                            )),
                    TextSpan(
                        text: 'and ',
                        style: Theme.of(context).textTheme.labelSmall),
                    TextSpan(
                        text: 'Terms of Use.',
                        style: Theme.of(context).textTheme.labelSmall!.apply(
                              color: dark ? Colors.white : Tcolors.primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  dark ? Colors.white : Tcolors.primaryColor,
                            )),
                  ])),
        
                  const SizedBox(
                    height: Tsizes.spacebtwnsection,
                  ),
        
                ],
              ),
            ),
          ),
        );
      }        
      ),
    );
  }
}
