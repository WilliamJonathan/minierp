import 'package:flutter/material.dart';
import 'package:minierp/rotas.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(
      const Duration(seconds: 2),
    ); // Simula um atraso de rede
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Aqui você pode adicionar a lógica de autenticação
    if (username == 'admin' && password == 'admin') {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, Rotas.homePage);
    } else {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return;
      // Exibir mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário ou senha inválidos')),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: _isLoading ? const LinearProgressIndicator() : Container(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _isLoading ? null : _login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
