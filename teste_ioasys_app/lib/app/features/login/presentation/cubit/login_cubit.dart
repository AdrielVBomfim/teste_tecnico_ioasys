import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teste_ioasys_app/app/common/headers/domain/repositories/iheaders_repository.dart';
import 'package:teste_ioasys_app/app/core/network/api_result.dart';
import 'package:teste_ioasys_app/app/features/login/domain/usecases/submeter_login_usecase.dart';
import 'package:teste_ioasys_app/injection_container.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    SubmeterLoginUsecase submeterLoginUsecase,
    IHeadersRepository iHeadersRepository,
  })  : _submeterLoginUsecase =
            submeterLoginUsecase ?? dependencia<SubmeterLoginUsecase>(),
        _iHeadersRepository =
            iHeadersRepository ?? dependencia<IHeadersRepository>(),
        super(LoginInitial());

  SubmeterLoginUsecase _submeterLoginUsecase;
  IHeadersRepository _iHeadersRepository;

  void submeterLogin(String email, String senha) async {
    emit(LoginCarregando());

    final resultado = await _submeterLoginUsecase(
      email: email,
      senha: senha,
    );

    resultado.fold(
      (erro) {
        if (erro is Erro) {
          emit(LoginErro(mensagemErro: erro.message));
        } else {
          emit(LoginInternetOff(mensagemErro: erro.message));
        }
      },
      (resposta) {
        _iHeadersRepository.gravarHeaders(
          uid: resposta.value('uid'),
          client: resposta.value('client'),
          accessToken: resposta.value('access-token'),
        );
        emit(LoginSucesso());
      },
    );
  }
}
