import 'package:flutter/material.dart';
import 'package:payment_interface/view/home_view.dart';
import 'package:payment_interface/view/pay_view.dart';
import 'package:payment_interface/view/success_view.dart';
import 'package:payment_interface/view/upi_view.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case '/pay':
        return MaterialPageRoute(
          builder: (context) => const PayView(),
        );
      case '/upi':
        String amount = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => UpiView(amount: amount),
        );
      case '/success':
        String amount = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => SuccessView(amount: amount),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('Route does not exist..'),
              ),
            );
          },
        );
    }
  }
}
