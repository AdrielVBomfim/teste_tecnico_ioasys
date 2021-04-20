part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();


  @override
  List<Object> get props => [];
}

class LoginCarregando extends LoginState {
  const LoginCarregando();

  @override
  List<Object> get props => [];
}

class LoginErro extends LoginState {
  const LoginErro({this.mensagemErro});

  final String mensagemErro;

  @override
  List<Object> get props => [];
}

class LoginInternetOff extends LoginState {
  const LoginInternetOff({this.mensagemErro});

  final String mensagemErro;

  @override
  List<Object> get props => [];
}

class LoginSucesso extends LoginState {
  @override
  List<Object> get props => [];
}
