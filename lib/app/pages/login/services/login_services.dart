import 'package:minierp/app/pages/login/interfaces/i_login_services.dart';
import 'package:minierp/app/pages/login/models/usuario_model.dart';
import 'package:minierp/app/utils/result_state.dart';

class LoginServices implements ILoginServices {
  @override
  Future<ResultState<UsuarioModel?>> login(String nome, String senha) async {
    // Simula um atraso de rede
    await Future.delayed(const Duration(seconds: 2));

    if (nome == 'admin' && senha == 'admin') {
      return SuccessResultState(
        result: UsuarioModel(
          id: '1',
          nome: 'admin',
          senha: 'admin',
          token: 'token',
        ),
      );
    } else {
      return ErrorResultState(message: 'Usuário ou senha inválidos');
    }
  }
}
