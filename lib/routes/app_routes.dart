

import 'package:get/get.dart';
import 'package:u1r/navigation_menu.dart';
import 'package:u1r/routes/routes.dart';

import '../features/shop/Home/widget/home.dart';

class Approutes{
  static final pages=[
    GetPage(name: Troutes.home, page: ()=> HomeScreen()),
//    GetPage(name: Troutes.navigation_menu, page: ()=> NavigationMenu())
];


}