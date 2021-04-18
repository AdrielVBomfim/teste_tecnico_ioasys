import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teste_ioasys_app/app/core/network/api_result.dart';
import 'package:teste_ioasys_app/app/features/login/domain/usecases/submeter_login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void submeterLogin(String email, String senha) async {
    emit(LoginCarregando());

    final resultado = await SubmeterLoginUsecase()(
      email: email,
      senha: senha,
    );

    resultado.fold(
      (erro) {
        if (erro is ApiError) {
          emit(LoginErro(mensagemErro: erro.message));
        } else {
          emit(LoginInternetOff(mensagemErro: erro.message));
        }
      },
      (r) => emit(LoginInitial()),
    );
  }
}
