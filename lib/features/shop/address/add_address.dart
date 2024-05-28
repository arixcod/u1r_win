import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/features/shop/address/addnewadres_controller.dart';
import 'package:u1r/features/shop/address/adress._controller.dart';

import '../../../helpers/helper_functions.dart';
import '../../../utils/constatnts/colors.dart';
import '../../../utils/constatnts/sizes.dart';
import '../../../utils/validators/validation.dart';

class addAddresscreen extends StatelessWidget {
  const addAddresscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contoller = Get.put(addadress());
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TcustomAppbar(
        showBackArrow: true,
        tittle: Text(
          'Add New Addresses',
        ),
      ),
      body: Obx(() {
        final spinner = contoller.showspinner;
        return ModalProgressHUD(
          inAsyncCall: spinner.value,
          progressIndicator: Center(
            child: CircularProgressIndicator(),
          ),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(Tsizes.defaultspacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: Tsizes.spacebtwnsection,
                ),

                ///form
                ///
                Form(
                    key: contoller.addadresskey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                enabled: false,
                                controller: contoller.firstName,
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
                                enabled: false,
                                controller: contoller.lastName,
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
                          enabled: false,
                          validator: (value) => TValidator.validateEmail(value),
                          controller: contoller.email,
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
                          controller: contoller.addres,
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
                          controller: contoller.landmar,
                          decoration: const InputDecoration(
                              label: Text('Landmark (optional)'),
                              prefixIcon: Icon(Iconsax.location)),
                          expands: false,
                        ),

                        const SizedBox(
                          height: Tsizes.spacebtwInputField,
                        ),

                        TextFormField(
                          controller: contoller.pincode,
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
                                controller: contoller.city,
                                validator: (value) =>
                                    TValidator.validateEmptystring(
                                        "City", value),
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
                                controller: contoller.state,
                                validator: (value) =>
                                    TValidator.validateEmptystring(
                                        "State", value),
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

                        //  signup button
                        const SizedBox(
                          height: Tsizes.spacebtwnsection,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Tcolors.primaryColorbtnshade),
                              onPressed: () {
                                contoller.addaddress();
                              },
                              child: Text("Save")),
                        ),

                        const SizedBox(
                          height: Tsizes.spacebtwnsection,
                        ),
                      ],
                    ))
              ],
            ),
          )),
        );
      }),
    );
  }
}
