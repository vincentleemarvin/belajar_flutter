import 'package:belajar_flutter/mockup/screen/HomeScreen.dart';
import 'package:belajar_flutter/mockup/screen/SplashScreen.dart';
import 'package:belajar_flutter/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/screen.dart';
import 'package:belajar_flutter/screen2.dart';
import 'package:belajar_flutter/form.dart';
import 'package:belajar_flutter/mockup.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // jika ingin mengirim argument
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/about':
        return MaterialPageRoute(builder: (_) => AboutPage());
      case '/baru':
        return MaterialPageRoute(builder: (_) => ScreenPage());
      case '/form':
        return MaterialPageRoute(builder: (_) => BelajarForm());
      case '/mockup':
        return MaterialPageRoute(builder: (_) => Mockup());
      case '/product':
        return MaterialPageRoute(builder: (_) => HomeScreen());

      //mo88i
      case '/mo88i':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/homo':
        return MaterialPageRoute(builder: (_) => HomeScreenMo());

      // return MaterialPageRoute(builder: (_) => AboutPage(args));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text('Error page')),
      );
    });
  }
}
