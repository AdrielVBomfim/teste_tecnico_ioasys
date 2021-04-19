import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teste_ioasys_app/app/features/home/domain/entities/empresa.dart';
import 'package:teste_ioasys_app/app/features/home/domain/usecases/consultar_empresas_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void consultarEmpresas({String consultaNome}) async {
    emit(HomeCarregando());

    final resultado =
        await ConsultarEmpresasUsecase()(consultaNome: consultaNome);

    resultado.fold(
      (erro) {
        emit(HomeErro(mensagemErro: erro.message));
      },
      (resposta) {
        emit(HomeCarregado(empresas: resposta));
      },
    );
  }
}
