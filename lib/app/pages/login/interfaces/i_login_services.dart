import 'package:minierp/app/pages/login/models/usuario_model.dart';
import 'package:minierp/app/utils/result_state.dart';

abstract class ILoginServices {
  Future<ResultState<UsuarioModel?>> login(String nome, String senha);
}
