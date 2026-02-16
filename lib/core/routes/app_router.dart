import 'package:flutter/material.dart';
import 'package:goldy/core/presentation/home_screen.dart';
import 'package:goldy/features/gold/presentation/screens/gold_screen.dart';
import 'package:goldy/features/silver/presentation/screens/silver_screen.dart';
import 'routes.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      case Routes.goldScreen:
        return MaterialPageRoute(
          builder: (context) {
          return const GoldScreen();
        },);
      case Routes.silverScreen:
        return MaterialPageRoute(
          builder: (context) {
          return const SilverScreen();
        },);
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
