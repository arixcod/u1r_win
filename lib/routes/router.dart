//here singlleton class is created

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:u1r/features/auth/screens/cartscreen/cart.dart';
import 'package:u1r/features/auth/screens/categoryscreen/categoryscreen.dart';

import '../features/shop/Home/widget/home.dart';
import '../navigation_menu.dart';


class CustomNavigationHelper{

    static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;

  static late final GoRouter router;

    // Keys Setup Here
  
  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  
  static final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();
  
  static final GlobalKey<NavigatorState> CategoryTabNavigatorKey =
      GlobalKey<NavigatorState>();
  
  static final GlobalKey<NavigatorState> cartTabNavigatorKey =
      GlobalKey<NavigatorState>();
  
  static final GlobalKey<NavigatorState> marketTabNavigatorKey =
      GlobalKey<NavigatorState>();
  
  


  //Gorouter Setup Here  ...

  BuildContext get context =>router.routerDelegate.navigatorKey.currentContext!;
  GoRouterDelegate get routerDelegate => router.routerDelegate;
  GoRouteInformationParser get routeInformationParser =>router.routeInformationParser;


  //Path String Here ...Temp



  static const String homePath = '/Homepath';
  static const String CategoryPath = '/signIn';
  static const String CartPath = '/detail';
  static const String MarketPath = '/rootDetail';

//factory method to make sure single instance of the class is returned


  factory CustomNavigationHelper() {
    return _instance;
  }


CustomNavigationHelper._internal(){


final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: homeTabNavigatorKey,
            routes: [
              GoRoute(
                path: homePath,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child:  HomeScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: CategoryTabNavigatorKey,
            routes: [
              GoRoute(
                path: CategoryPath,
                pageBuilder: (context, state) {
                  return getPage(
                    child:  CategoryScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: cartTabNavigatorKey,
            routes: [
              GoRoute(
                path: CartPath,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const Cartscreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
 
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: BottomNavigationPage(
              child: navigationShell,
            ),
            state: state,
          );
        },
      ),


];
    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: homePath,
      routes: routes,
    );

}
static Page getPage({
    required Widget child,
    required GoRouterState state,
  })
  
   {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }

}