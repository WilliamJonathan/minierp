import 'package:flutter/material.dart';
import 'package:minierp/app/pages/login/stores/login_page_store.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<LoginPageStore>(
          builder: (context, loginStore, _) {
            return Text('Home Page - ${loginStore.usuarioModel?.nome ?? ''}');
          },
        ),
      ),
      body: const Center(child: Text('Welcome to the Home Page!')),
    );
  }
}
