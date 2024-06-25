import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:u1r/bindings/general_bindings.dart';
import 'package:u1r/routes/router.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return GetMaterialApp.router(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme, 
      darkTheme: TAppTheme.darkTheme,
      routeInformationProvider: CustomNavigationHelper.router.routeInformationProvider,
      routeInformationParser: CustomNavigationHelper.router.routeInformationParser,
      routerDelegate:CustomNavigationHelper.router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
    
  }
}