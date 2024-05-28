import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/custom%20shapes/curved%20edges/curved_edges.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/features/auth/controllers/login/logincontroller.dart';
import 'package:u1r/features/auth/screens/login/otp_verification.dart';
import 'package:u1r/features/shop/Home/widget/home.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';
import 'package:get/get.dart';
import 'package:u1r/utils/constatnts/text_string.dart';
import 'package:firebase_auth/firebase_auth.dart';

class reAuthForm extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final TextEditingController _textinput = TextEditingController();
  reAuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(loginController());
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TcustomAppbar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Iconsax.profile_delete,
              color: Tcolors.white,
            ),
          )
        ],
        showBackArrow: true,
        tittle: Text(
          'Delete account',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Tcolors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: Tsizes.appbarHieght,
            left: Tsizes.defaultspacing,
            right: Tsizes.defaultspacing,
            bottom: Tsizes.defaultspacing,
          ),
          child: Center(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
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
                                  if (value.isEmpty || length != 10) {}
                                  return 'Invalid Phone Number';
                                },
                                keyboardType: TextInputType.number,
                                controller: _textinput,
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
                                      style: ElevatedButton.styleFrom(backgroundColor: Tcolors.primaryColorbtnshade),
                                        onPressed: () async {
                                        if (_textinput.text.isEmpty ||
                                            _textinput.text.length == 10) {
                                          _auth.verifyPhoneNumber(
                                              verificationCompleted:
                                                  (PhoneAuthCredential
                                                      credential) {},
                                              verificationFailed:
                                                  (FirebaseAuthException
                                                      error) {},
                                              codeSent: (String verificationId,
                                                  int? resendToken) {
                                                Get.to(OTPVerifyScreen(
                                                  verificationId:
                                                      verificationId,
                                                ));
                                              },
                                              codeAutoRetrievalTimeout:
                                                  (String verificationId) {},
                                              phoneNumber: '+91' +
                                                  _textinput.text.toString());
                                        } else {
                                         }

                                        //
                                      },
                                      child: Text(
                                        'Authinticate',
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

                SizedBox(
                  width: double.infinity,
                  child: Expanded(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'By Continuing, all your ',
                          style: Theme.of(context).textTheme.labelSmall),
                      TextSpan(
                          text: 'data ',
                          style: Theme.of(context).textTheme.labelSmall!.apply(
                                color:
                                    dark ? Colors.white : Tcolors.primaryColor,
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    dark ? Colors.white : Tcolors.primaryColor,
                              )),
                      TextSpan(
                          text: 'including',
                          style: Theme.of(context).textTheme.labelSmall),
                      TextSpan(
                          text: 'profile ,cart,orders data .',
                          style: Theme.of(context).textTheme.labelSmall!.apply(
                                color:
                                    dark ? Colors.white : Tcolors.primaryColor,
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    dark ? Colors.white : Tcolors.primaryColor,
                              )),
                      TextSpan(
                          text: 'will be deleted forever  ',
                          style: Theme.of(context).textTheme.labelSmall),
                    ])),
                  ),
                ),

                const SizedBox(
                  height: Tsizes.spacebtwnsection,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
