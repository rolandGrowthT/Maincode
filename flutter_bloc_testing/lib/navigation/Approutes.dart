import 'package:flutter/material.dart';
import 'package:flutter_bloc_testing/presentation/screens/LoginPage.dart';
import 'package:flutter_bloc_testing/presentation/screens/SignUpPage.dart';
import 'package:flutter_bloc_testing/presentation/screens/home_screen_page.dart';
import 'package:flutter_bloc_testing/presentation/screens/loadingScreen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/loadingpage':
        return MaterialPageRoute(builder: (_) => Loadingscreen());
      case '/SignUpPage':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/LoginPage':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/homePage':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
