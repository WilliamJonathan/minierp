import 'package:flutter/material.dart';
import 'package:minierp/app/pages/home/home_page.dart';
import 'package:minierp/app/pages/login/login_page.dart';

class Rotas {
  static const String homePage = '/homePage';
  static const String loginPage = '/';

  static Route<dynamic> gerarRotas(RouteSettings settings) {
    if (settings.name == homePage) {
      return MaterialPageRoute(builder: (_) => HomePage());
    } else if (settings.name == loginPage) {
      return MaterialPageRoute(builder: (_) => LoginPage());
    } else {
      return MaterialPageRoute(builder: (_) => NotFoundScreen());
    }
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Not Found')),
      body: Center(child: Text('404 - Page not found')),
    );
  }
}
