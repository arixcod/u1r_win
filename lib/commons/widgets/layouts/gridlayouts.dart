import 'package:flutter/material.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

class Tgridlayout extends StatelessWidget {
  const Tgridlayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 295,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: Tsizes.gridviewSpacing,
            crossAxisSpacing: Tsizes.gridviewSpacing,
            mainAxisExtent: mainAxisExtent),
        itemBuilder: itemBuilder);
  }
}
