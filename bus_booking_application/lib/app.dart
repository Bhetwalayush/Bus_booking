import 'package:bus_booking_application/core/app_theme/app_theme.dart';
import 'package:bus_booking_application/routes/app_route.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ayush_Bus Booking',

      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      initialRoute: AppRoute.homeRoute,
      // theme: ThemeData(
      //     primarySwatch: Colors.orange, scaffoldBackgroundColor: Colors.grey),
      routes: AppRoute.getAppRoutes(),
    );
  }
}
