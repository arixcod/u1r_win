import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/commons/widgets/custom_appbar/custom_apbbar.dart';
import 'package:u1r/features/auth/controllers/signup_controller.dart';
import 'package:u1r/features/auth/controllers/userupdatecontroller/edituserprofile.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/navigation_menu.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';
import 'package:u1r/utils/validators/validation.dart';


class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {

   final controller=Get.put(ChangeNameController());   


    final dark =THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TcustomAppbar(

        
        showBackArrow: true,
        tittle: Text(
          'Update profile',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Tcolors.white,
            fontSize: 18
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Tsizes.defaultspacing),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                  Text('Update Your Profile',style: Theme.of(context).textTheme.headlineMedium,),
                  const SizedBox(height: Tsizes.spacebtwnsection,),
                  ///form
                  ///
                  Form(
                    key: controller.updateUserNameFormKey,
                    child:Column(
                      children: [
                          Column(
                            children: [
                              TextFormField(
                                controller: controller.firstName,
                                validator: (value) => TValidator.validateEmptystring("First Name", value),
                                decoration:const InputDecoration(label: Text('First Name'),
                                prefixIcon: Icon(Icons.person)),
                                expands: false,
                              ),
                              const SizedBox(height: Tsizes.spacebtwInputField,),
                  
                              TextFormField(

                                controller: controller.lastName,
                                validator: (value) => TValidator.validateEmptystring("First Name", value),                                 
                                decoration:const InputDecoration(label: Text('Last Name'),
                                prefixIcon: Icon(Icons.person)),
                                expands: false,
                              ),
                                        const SizedBox(height: Tsizes.spacebtwInputField,),
                  
                             TextFormField(

                                controller: controller.email,
                                validator: (value) => TValidator.validateEmptystring("First Name", value),                                 
                                decoration:const InputDecoration(label: Text('email'),
                                prefixIcon: Icon(Icons.person)),
                                expands: false,
                              ),
                            
            const SizedBox(height: Tsizes.spacebtwInputField,),
                  

                             TextFormField(

                                controller: controller.gst,
                                validator: (value) => TValidator.validateEmptystring("Gst", value),                                 
                                decoration:const InputDecoration(label: Text('Gst'),
                                prefixIcon: Icon(Icons.person)),
                                expands: false,
                              ),
                            

                              const SizedBox(height: Tsizes.spacebtwInputField,),
                  
                                TextFormField(
                                controller: controller.addres,
                                validator: (value) => TValidator.validateEmptystring("Adress", value),                                 
                                decoration:const InputDecoration(label: Text('Address'),
                                prefixIcon: Icon(Icons.person)),
                                expands: false,
                              ),

                            
                            ],



                          ), 

                          

       const SizedBox(height: Tsizes.spacebtwnsection,),
        SizedBox(width: double.infinity,child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Tcolors.primaryColorbtnshade,
            ),
          onPressed: (

        ){
              controller.updateusername();

        }, child: Text("Update",style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Tcolors.white,
            fontSize: 18
          ),)),),

        const SizedBox(height: Tsizes.spacebtwnsection,),

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



                    ],) 
                  )
          ],),),

      ),
    );
  }
}