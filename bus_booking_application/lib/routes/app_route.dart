import 'package:bus_booking_application/view/home_screen.dart';

class AppRoute {
  AppRoute._();

  static String homeRoute = '/';

  static getAppRoutes() {
    return {
      homeRoute: (context) => const HomeScreen(),
    };
  }
}
