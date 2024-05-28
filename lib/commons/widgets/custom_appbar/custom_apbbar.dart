import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:u1r/utils/constatnts/sizes.dart';
import 'package:u1r/utils/device/device_utility.dart';

import '../../../utils/constatnts/colors.dart';

class TcustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TcustomAppbar({
    super.key,
    this.tittle,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingonPresses,
    this.hieght=60
  });

  final Widget? tittle;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingonPresses;
  final double hieght;
  @override
  Widget build(BuildContext context) {
    return AppBar(
    
      backgroundColor: Tcolors.primaryColor,
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(
              color: Tcolors.white,
              onPressed: () => Get.back(closeOverlays: true,),
              icon: const Icon(Iconsax.arrow_left))
          : leadingIcon != null
              ? IconButton(onPressed: leadingonPresses, icon: Icon(leadingIcon))
              : null,
      title: tittle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(hieght);
}
