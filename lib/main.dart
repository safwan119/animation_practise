import 'package:animation_practise/route/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Duration duration = Duration(seconds: 2);
  static const Curve curves = Curves.easeIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Practise',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: AppRoutes.painterView,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
