import 'package:flutter/material.dart';
import 'package:goldy/core/routes/app_router.dart';
import 'package:goldy/core/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
