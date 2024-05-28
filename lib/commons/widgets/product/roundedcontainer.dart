import 'package:flutter/material.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

class TroundedConatiner extends StatelessWidget{

  const TroundedConatiner({
                this.width, 
                this.height, 
                this.radius=Tsizes.cardRadiusLg, 
                this.child, 
                this.showBorder=false,
                this.borderColor=Tcolors.primaryBackground,
                this.backgroundColor=Tcolors.white,
                this.margin,
                this.padding     
                });

  final double? width,height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? margin,padding;
  
  @override
  Widget build(BuildContext context) {
        return Container(
           width: width,
           height: height,
              padding: padding,
             margin: margin,
            decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
            border: showBorder?Border.all(color: borderColor):null
          ),
        child: child,
        );
   
    }}