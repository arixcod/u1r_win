import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:u1r/commons/widgets/cartmenuIcon/cartmenuIcon.dart';
import 'package:u1r/features/auth/controllers/user_profile_controller.dart';
import 'package:u1r/features/auth/screens/cartscreen/cart.dart';
import 'package:u1r/features/auth/screens/categoryscreen/categoryscreen.dart';
import 'package:u1r/features/shop/Home/controller/HomeController.dart';
import 'package:u1r/features/shop/Home/widget/home.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'commons/widgets/appdrawer/customAppDrawer.dart';
import 'features/auth/screens/marketwatchlist/marketwatchlis.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller_drawer = Get.put(HomeController());
    final controller = Get.put(NavigationController());
    final userdata = Get.put(UserProfileController());
    return Scaffold(
      key: controller_drawer.drawerglabalkey,
      drawer: Drawer(
        child: CustomAppdrawer(
          user: userdata.user,
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Iconsax.category), label: 'Category'),
              NavigationDestination(
                  icon: cartmenuicon(
                  ),
                  label: 'Cart'),
              NavigationDestination(
                  icon: Icon(Iconsax.trend_up), label: 'Trend'),
            ]),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
    CategoryScreen(),
    const Cartscreen(),
    const MarketWatchlist(),
  ];
}
