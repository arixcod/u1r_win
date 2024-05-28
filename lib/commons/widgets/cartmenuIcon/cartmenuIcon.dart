import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/features/auth/controllers/cart_controller.dart/cart_controller.dart';

import '../../../helpers/helper_functions.dart';
import '../../../utils/constatnts/colors.dart';
import 'package:badges/badges.dart' as badges;

class cartmenuicon extends StatelessWidget {
  const cartmenuicon({
    super.key,
  });


  @override
  Widget build(BuildContext context) {


 
   // calling the cart controller
   final controller=Get.put(cartController());
   final dark =THelperFunctions.isDarkMode(context);
   
    return badges.Badge(
        badgeAnimation: const badges.BadgeAnimation.rotation(
          animationDuration: Duration(seconds: 1),
          colorChangeAnimationDuration: Duration(seconds: 1),
          loopAnimation: false,
          curve: Curves.fastOutSlowIn,
          colorChangeAnimationCurve: Curves.easeInCubic,
        ),
            badgeStyle: const badges.BadgeStyle(
            shape: badges.BadgeShape.circle,
            badgeColor: Colors.black,
            padding: EdgeInsets.all(4)),
            position:
            badges.BadgePosition.topStart(top: -12, start: 18),
          badgeContent: Obx(
          ()=> Text(
               controller.cartItems.length.toString(),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w400, color: Tcolors.white),
                  ),
          ),
        child: Icon(Icons.shopping_cart_checkout,color: dark?Tcolors.light:Tcolors.blck));
  }
}
