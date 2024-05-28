import 'package:flutter/material.dart';
import 'package:u1r/utils/constatnts/colors.dart';

class TshadowStyle{
  static final verticalShadowbox=BoxShadow(
    color: Tcolors.darkergrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0,2)
  );


static final horizontalShadowbox=BoxShadow(
    color: Tcolors.darkergrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0,2)
  );
} 