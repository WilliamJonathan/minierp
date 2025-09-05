import 'package:flutter/material.dart';
import 'package:minierp/app/pages/login/interfaces/i_login_services.dart';
import 'package:minierp/app/pages/login/models/usuario_model.dart';
import 'package:minierp/app/pages/login/services/login_services.dart';
import 'package:minierp/app/utils/generic_states.dart';

class LoginPageStore extends ChangeNotifier {
  final ILoginServices _loginServices = LoginServices();

  GenericStates _state = EmptyGenericState();
  GenericStates get state => _state;
  set state(GenericStates value) {
    _state = value;
    notifyListeners();
  }

  UsuarioModel? _usuarioModel;
  UsuarioModel? get usuarioModel => _usuarioModel;
  set usuarioModel(UsuarioModel? value) {
    _usuarioModel = value;
    notifyListeners();
  }

  Future<void> login(String nome, String senha) async {
    state = LoadingGenericState();
    final result = await _loginServices.login(nome, senha);
    result.fold(
      onSuccess: (usuario) {
        usuarioModel = usuario;
        state = SuccessGenericState(data: usuario);
      },
      onError: (message) {
        state = ErrorGenericState(message: message);
      },
    );
  }
}
