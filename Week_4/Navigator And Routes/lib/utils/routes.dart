import 'package:flutter/material.dart';
import 'package:navigator_and_routes/home_page.dart';
import 'package:navigator_and_routes/second_page.dart';
import 'package:navigator_and_routes/third_page.dart';
import 'package:navigator_and_routes/utils/routes_name.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name) {
      case RoutesName.homePage:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RoutesName.secondPage:
        return MaterialPageRoute(builder: (context) => const SecondPage());
      case RoutesName.thirdPage:
        return MaterialPageRoute(builder: (context) => const ThirdPage());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body:
                Text('No Routes available'),
          );
        }
        );
    }
  }
}