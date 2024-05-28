import 'package:flutter/material.dart';
import 'package:u1r/commons/styles/shadow.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';


class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding:const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [TshadowStyle.verticalShadowbox],
        borderRadius: BorderRadius.circular(Tsizes.divproductImageRadius),
        color: THelperFunctions.isDarkMode(context)?Tcolors.darkgrey:Tcolors.white
      ),
       child: Column(
        children: [
    
    ],
  ),
 
    );
  }
}