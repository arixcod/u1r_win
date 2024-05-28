import 'package:flutter/material.dart';

import '../../../utils/constatnts/colors.dart';
import '../../../utils/constatnts/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../custom shapes/customshapes/customshape.dart';

class TprimaryHeader extends StatelessWidget {
  final Widget child;

  const TprimaryHeader({
    super.key,
    required this.child,
    this.hieght=400,
    this.color=Tcolors.primaryColor
  });

  final double? hieght;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return custom_shape_cruved(
      child: Column(
        children: [
          
          Container(
            color: color,
            padding: const EdgeInsets.all(0),
            child: SizedBox(
              height: hieght,
              child: Stack(
                children: [
                  Container(
                    width: TDeviceUtils.getScreenWidth(context),
                    padding: const EdgeInsets.all(Tsizes.md),
                    decoration: BoxDecoration(
                        border: Border.all(color: Tcolors.accent)),
                  ),
                       Positioned(
                        top: -150,
                        right: -250,
                        child: Tcircular(
                        backgroundColor: Tcolors.white.withOpacity(0.1),
                      )),
                      Positioned(
                        top: 100,
                        right: -300,
                        child: Tcircular(
                        backgroundColor: Tcolors.white.withOpacity(0.1))),
                        child
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
