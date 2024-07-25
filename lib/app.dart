import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:u1r/bindings/general_bindings.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBindings(),
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme, 
         darkTheme: TAppTheme.darkTheme,
          
            //To show while Auth repo decides which screen to show   
          
             home:
             Scaffold(
             backgroundColor: Color.fromARGB(255, 15, 31, 10),
             body:
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('U1r',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Tcolors.white,
                        fontSize: 80,
                        fontWeight: FontWeight.w800,
                        letterSpacing:1,
                        decoration: TextDecoration.underline,
                        decorationColor: const Color.fromARGB(255, 206, 128, 49)
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: const  Icon(Icons.shopping_cart_checkout,color: Tcolors.white,),
                      )
                    ],
                  ),
       
                   Text('Everything under one roof',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Tcolors.white,
                        fontSize: 14,
                        letterSpacing:1
                      ),
                        ),

                  Lottie.asset(TImages.settingupforthefirsttime,
                  height: 100),
               
                ],
            )
          
          ),
         debugShowCheckedModeBanner: false,
    );
    
  }
}