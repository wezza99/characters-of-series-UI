import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_router.dart';

void main() {
  runApp(breakingBadApp(approuter: AppRouter(),));
}

class breakingBadApp extends StatelessWidget {
  final AppRouter approuter;

  const breakingBadApp({super.key, required this.approuter});

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:approuter.generateRoute,
    );
  }
}




