import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/features/auth/screens/searchscreen/searchscreen.dart';

import '../../../utils/constatnts/sizes.dart';

class searchwidget extends StatelessWidget {
  const searchwidget(
      {super.key,
      this.padding =
          const EdgeInsets.symmetric(horizontal: Tsizes.defaultspacing)});

  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SearchBar(
          onTap: () {
            Get.to(() => SeacrhScreen(),
                opaque: true,
                transition: Transition.rightToLeftWithFade,
                duration: Duration(microseconds: 1000));
          },
          elevation: MaterialStatePropertyAll(1),
          leading: Icon(Icons.search),
          trailing: [Icon(Icons.speaker), Icon(Icons.mic)],
          backgroundColor:
              MaterialStatePropertyAll<Color>(Colors.white.withOpacity(0.8)),
          hintText: 'Search ...'),
    );
  }
}
