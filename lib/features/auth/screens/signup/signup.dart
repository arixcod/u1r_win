import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:u1r/features/auth/controllers/signup_controller.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/navigation_menu.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';
import 'package:u1r/utils/validators/validation.dart';

import '../../../../commons/widgets/cartmenuIcon/cartmenuIcon.dart';
import '../../../../commons/widgets/custom_appbar/custom_apbbar.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TcustomAppbar(
        tittle: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'U1r',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w800, fontSize: 34),
            ),
             Padding(
             padding: const EdgeInsets.only(bottom: 4),
             child: Icon(Icons.shopping_cart,size: 14,color: Colors.white,),
           )
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Icon(Iconsax.profile_circle,color: Tcolors.white,)),
          
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall:false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Tsizes.defaultspacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Complete Your Profile',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: Tsizes.spacebtwnsection,
                ),
      
                ///form
                ///
                Form(
                    key: controller.singupformKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: controller.firstName,
                                validator: (value) =>
                                    TValidator.validateEmptystring(
                                        "First Name", value),
                                decoration: const InputDecoration(
                                    label: Text('First Name'),
                                    prefixIcon: Icon(Icons.person)),
                                expands: false,
                              ),
                            ),
                            const SizedBox(
                              width: Tsizes.spacebtwInputField,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: controller.lastName,
                                validator: (value) =>
                                    TValidator.validateEmptystring(
                                        "First Name", value),
                                decoration: const InputDecoration(
                                    label: Text('Last Name'),
                                    prefixIcon: Icon(Icons.person)),
                                expands: false,
                              ),
                            ),
                          ],
                        ),
      
                  // email
                        const SizedBox(
                          height: Tsizes.spacebtwInputField,
                        ),
                        TextFormField(
                          controller: controller.email,
                          validator: (value) => TValidator.validateEmail(value),
                          decoration: const InputDecoration(
                              label: Text('E-Mail'),
                              prefixIcon: Icon(Icons.email)),
                          expands: false,
                        ),
      
      // email
      
      // email
                        const SizedBox(
                          height: Tsizes.spacebtwInputField,
                        ),
                        TextFormField(
                          controller: controller.gst,
                          validator: (value) =>
                              TValidator.validateEmptystring("GST Number", value),
                          decoration: const InputDecoration(
                              label: Text('GST Number'),
                              prefixIcon: Icon(Iconsax.paperclip)),
                          expands: false,
                        ),
                        const SizedBox(
                          height: Tsizes.spacebtwInputField,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                                child: Divider(
                              color: dark ? Tcolors.darkgrey : Tcolors.grey,
                              thickness: 0.5,
                              indent: 60,
                              endIndent: 5,
                            )),
                            Text(
                              'Enter Your Address',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Flexible(
                                child: Divider(
                              color: dark ? Tcolors.darkgrey : Tcolors.grey,
                              thickness: 0.5,
                              indent: 5,
                              endIndent: 60,
                            ))
                          ],
                        ),
      
                        const SizedBox(
                          height: Tsizes.spacebtwInputField,
                        ),
      
                        TextFormField(
                          controller: controller.adressLine1,
                          validator: (value) =>
                              TValidator.validateEmptystring("Address", value),
                          decoration: const InputDecoration(
                              label: Text('Address line 1'),
                              prefixIcon: Icon(Iconsax.building)),
                          expands: false,
                        ),
      
                        const SizedBox(
                          height: Tsizes.spacebtwInputField,
                        ),
      
                        TextFormField(
                          controller: controller.landmark,
                          decoration: const InputDecoration(
                              label: Text('Landmark (optional)'),
                              prefixIcon: Icon(Iconsax.location)),
                          expands: false,
                        ),
      
                        const SizedBox(
                          height: Tsizes.spacebtwInputField,
                        ),
      
                        TextFormField(
                          controller: controller.pincode,
                          validator: (value) =>
                              TValidator.validateEmptystring("Pin code", value),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              label: Text('Pin code'),
                              prefixIcon: Icon(Icons.post_add)),
                          expands: false,
                        ),
      
      // email
                        const SizedBox(
                          height: Tsizes.spacebtwInputField,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: controller.city,
                                validator: (value) =>
                                    TValidator.validateEmptystring("City", value),
                                decoration: const InputDecoration(
                                    label: Text('City'),
                                    prefixIcon: Icon(Icons.person)),
                                expands: false,
                              ),
                            ),
                            const SizedBox(
                              width: Tsizes.spacebtwInputField,
                            ),
                            Expanded(
                              child: TextFormField(
                                validator: (value) =>
                                    TValidator.validateEmptystring(
                                        "State", value),
                                controller: controller.state,
                                decoration: const InputDecoration(
                                    label: Text('State'),
                                    prefixIcon: Icon(Icons.person)),
                                expands: false,
                              ),
                            ),
                          ],
                        ),
      
                        //checkbox
                        const SizedBox(
                          height: Tsizes.spacebtwnsection,
                        ),
      
                        Row(
                          children: [
                            SizedBox(
                                width: 20,
                                height: 20,
                                child:
                                    Checkbox(value: true, onChanged: (value) {})),
                            const SizedBox(
                              width: Tsizes.spacebtwInputField,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: 'I agree to ',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: 'Privacy Policy ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        color: dark
                                            ? Colors.white
                                            : Tcolors.primaryColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? Colors.white
                                            : Tcolors.primaryColor,
                                      )),
                              TextSpan(
                                  text: 'and ',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: 'Terms of Use',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        color: dark
                                            ? Colors.white
                                            : Tcolors.primaryColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? Colors.white
                                            : Tcolors.primaryColor,
                                      )),
                            ]))
                          ],
                        ),
                        //  signup button
                        const SizedBox(
                          height: Tsizes.spacebtwnsection,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                controller.signup();
                              },
                              child: Text("Continue")),
                        ),
      
                        const SizedBox(
                          height: Tsizes.spacebtwnsection,
                        ),
      
                        //  const SizedBox(height: Tsizes.spacebtwnsection,),
      
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
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
