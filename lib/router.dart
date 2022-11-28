import 'package:amazone_clone_tutorial/common/widgets/bottom-bar.dart';
import 'package:amazone_clone_tutorial/features/admin/screen/add_proucts_screen.dart';
import 'package:amazone_clone_tutorial/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

import 'features/home/screens/home_screen.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    //admin
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Page Does'nt Exist"),
          ),
        ),
      );
  }
}
