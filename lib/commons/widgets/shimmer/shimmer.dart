import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:u1r/helpers/helper_functions.dart';

import '../../../utils/constatnts/colors.dart';



// this is the reusable shimmer effect


class TShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color? color;
  const TShimmerWidget(
      {
        
      Key? key,
      required this.width,
      required this.height,
       this.radius=15, this.color}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor:dark? Colors.grey[850]!:Colors.grey[300]!,
      highlightColor: dark? Colors.grey[700]!:Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color??(dark? Tcolors.darkergrey:Tcolors.white ), 
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
