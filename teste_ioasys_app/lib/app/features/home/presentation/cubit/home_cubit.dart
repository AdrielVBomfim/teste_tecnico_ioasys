import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teste_ioasys_app/app/features/home/domain/entities/empresa.dart';
import 'package:teste_ioasys_app/app/features/home/domain/usecases/consultar_empresas_usecase.dart';
import 'package:teste_ioasys_app/injection_container.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({ConsultarEmpresasUsecase consultarEmpresasUsecase})
      : _consultarEmpresasUsecase =
            consultarEmpresasUsecase ?? dependencia<ConsultarEmpresasUsecase>(),
        super(HomeInitial());

  ConsultarEmpresasUsecase _consultarEmpresasUsecase;

  void consultarEmpresas({String consultaNome}) async {
    emit(HomeCarregando());

    final resultado =
        await _consultarEmpresasUsecase(consultaNome: consultaNome);

    resultado.fold(
      (erro) {
        if (erro.statusCode == 401) {
          emit(HomeFalhaCredenciais());
          return;
        }

        emit(HomeErro(mensagemErro: erro.message));
      },
      (resposta) {
        emit(HomeCarregado(empresas: resposta));
      },
    );
  }
}
