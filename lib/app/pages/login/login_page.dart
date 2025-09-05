import 'package:flutter/material.dart';
import 'package:minierp/app/pages/login/stores/login_page_store.dart';
import 'package:minierp/app/utils/generic_states.dart';
import 'package:minierp/rotas.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final loginStore = Provider.of<LoginPageStore>(context, listen: false);
    final username = _usernameController.text;
    final password = _passwordController.text;

    await loginStore.login(username, password);
    final state = loginStore.state;
    // Aqui você pode adicionar a lógica de autenticação
    if (state is SuccessGenericState) {
      if (!mounted) return;
      // Navigator.pushReplacementNamed(context, Rotas.homePage);
      Navigator.pushNamed(context, Rotas.homePage);
    } else if (state is ErrorGenericState) {
      if (!mounted) return;
      // Exibir mensagem de erro
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.message)));
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
          child: Consumer<LoginPageStore>(
            builder: (context, loginStore, _) {
              return PreferredSize(
                preferredSize: const Size.fromHeight(4.0),
                child: loginStore.state is LoadingGenericState
                    ? const LinearProgressIndicator()
                    : Container(),
              );
            },
          ),
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
            Consumer<LoginPageStore>(
              builder: (context, loginStore, _) {
                return ElevatedButton(
                  onPressed: loginStore.state is LoadingGenericState
                      ? null
                      : _login,
                  child: const Text('Login'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
