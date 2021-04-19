part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object> get props => [];
}

class HomeCarregando extends HomeState {
  const HomeCarregando();

  @override
  List<Object> get props => [];
}

class HomeCarregado extends HomeState {
  const HomeCarregado({this.empresas});

  final List<Empresa> empresas;

  @override
  List<Object> get props => [];
}

class HomeErro extends HomeState {
  const HomeErro({this.mensagemErro});

  final String mensagemErro;

  @override
  List<Object> get props => [];
}

