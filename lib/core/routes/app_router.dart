import 'package:flutter/material.dart';
import 'package:goldy/core/presentation/home_screen.dart';
import 'routes.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );

        default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text("No Route Defiened for ${settings.name}"),
            ),
          );
        },);
    }
  }
}
