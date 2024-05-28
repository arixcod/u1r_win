import 'package:flutter/material.dart';

import '../../../../utils/constatnts/colors.dart';
import '../curved edges/curved_edges.dart';

class custom_shape_cruved extends StatelessWidget {
  final Widget? child;

  const custom_shape_cruved({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TcustomCurvedEdges(), child: child);
  }
}

class Tcircular extends StatelessWidget {
  const Tcircular({
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.backgroundColor = Tcolors.white,
    super.key,
    this.margin
  });

    Tcircular.circularSmall({
    required this.width ,
    required this.height ,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.backgroundColor = Tcolors.white,
    super.key,
    this.margin
  });

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final Widget? child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(400),
          color: backgroundColor),
          child: child,
    );
  }
}
