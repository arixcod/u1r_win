import 'package:flutter/material.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

class Tcircularicons extends StatelessWidget {
  const Tcircularicons(
      {super.key,
      this.width,
      this.height,
      this.size = Tsizes.lg,
      required this.icon,
      this.color,
      this.backgroundColor,
      this.onPressed,
      this.radius = 100});

  final double radius;
  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor != null
              ? backgroundColor!
              : THelperFunctions.isDarkMode(context)
                  ? Tcolors.blck.withOpacity(0.9)
                  : Tcolors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(radius)),
        child: Center(
          child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: onPressed,
              icon: Icon(
                icon,
                size: size,
                color: color,
              ))),
    );
  }
}
