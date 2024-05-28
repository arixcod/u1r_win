import 'package:flutter/material.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/device/device_utility.dart';

class Ttabbar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;

  const Ttabbar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? Tcolors.blck : Tcolors.white,
      child:        TabBar(

                      isScrollable: false,
                      indicatorColor: Tcolors.primaryColor,
                      unselectedLabelColor: Tcolors.darkgrey,
                      labelColor: THelperFunctions.isDarkMode(context)
                          ? Tcolors.white
                          : Tcolors.primaryColor,
                            
                      tabs: tabs),
           );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
