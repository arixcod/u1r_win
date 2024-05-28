import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:u1r/features/auth/controller.onboarding/onboardingcontroller.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/Image_strings.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';
import 'package:u1r/utils/constatnts/text_string.dart';
import 'package:u1r/utils/device/device_utility.dart';


class OnBoardingscreen extends StatelessWidget {
  const OnBoardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(OnBoardingController());
    return  Scaffold(
      
      body: 
    
        Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                OnBoardingPage(image: TImages.onboardingImage1,title: TTextstring.onBoardingTitle1,subtitle: TTextstring.onBoardingsubTitle1,),
                OnBoardingPage(image: TImages.onboardingImage2,title: TTextstring.onBoardingTitle2,subtitle: TTextstring.onBoardingsubTitle2,),
                OnBoardingPage(image: TImages.onboardingImage3,title: TTextstring.onBoardingTitle3,subtitle: TTextstring.onBoardingsubTitle3,),
              ],
            )
        
        
       //skip biutton
      
,
      Positioned(
        
        top:TDeviceUtils.getAppBarHeight(),
        right: Tsizes.defaultspacing,
        child: TextButton(onPressed: (){
          OnBoardingController.instance.skipPage();
        },child: Text('Skip',style: Theme.of(context).textTheme.titleMedium),)),
        OnBoardingdotNavigator(),        
        nextonboardingbtn()


        ],)
    

    ,);
  }
}

class nextonboardingbtn extends StatelessWidget {
  const nextonboardingbtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    
    return Positioned(

      bottom: TDeviceUtils.getBottomNavigationBarHeight()+25,
      right: Tsizes.defaultspacing,
      
    child: ElevatedButton(
    
      style:ElevatedButton.styleFrom(shape:const CircleBorder(),backgroundColor:dark?Tcolors.primaryColor: Colors.black),
      onPressed: (){

        OnBoardingController.instance.nextPage();
      }, child: 
    
    Icon(
      Icons.arrow_circle_right_outlined)
    ));
  }
}

class OnBoardingdotNavigator extends StatelessWidget {

  
  const OnBoardingdotNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=OnBoardingController.instance;
  
    final dark=THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight()+25,
      left: Tsizes.defaultspacing,
      
      child: SmoothPageIndicator(
        
        effect: ExpandingDotsEffect(
          activeDotColor: dark?Tcolors.dark:Tcolors.light,
          dotHeight: 6
        ),
        onDotClicked: controller.dotNavigator,
        controller: controller.pageController, count: 3));



  }
}





class OnBoardingPage extends StatelessWidget {


  final String image,title,subtitle;
  const OnBoardingPage({
    super.key, required this.image, required this.title, required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Tsizes.defaultspacing),
      child: Column(
        children: [
          
          Lottie.asset(
            image,
            width:THelperFunctions.screenWidth()*0.8,
            height: THelperFunctions.screenHeight()/2
             ),
           Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
           const  SizedBox(height:Tsizes.spacebtwnitems ,),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}