import 'package:flutter/material.dart';
import 'package:minierp/app/pages/login/stores/login_page_store.dart';
import 'package:minierp/rotas.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LoginPageStore())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiniERP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: Rotas.gerarRotas,
      initialRoute: Rotas.loginPage,
      debugShowCheckedModeBanner: false,
    );
  }
}
