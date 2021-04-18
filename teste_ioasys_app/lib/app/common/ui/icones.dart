import 'package:meta/meta.dart';

abstract class Icones {
  static String _common({@required String nomeIcone}) {
    return 'assets/images/common/$nomeIcone.png';
  }

  static String _login({@required String nomeIcone}) {
    return 'assets/images/login/$nomeIcone.png';
  }

  static String _splash({@required String nomeIcone}) {
    return 'assets/images/splash/$nomeIcone.png';
  }

  static String _home({@required String nomeIcone}) {
    return 'assets/images/home/$nomeIcone.png';
  }

  static String get iconeLogo => _login(nomeIcone: 'logo');
  static String get iconeLogoComTitulo => _splash(nomeIcone: 'logo_com_titulo');
  static String get background => _common(nomeIcone: 'background');
  static String get iconeErro => _common(nomeIcone: 'icone_erro');
  static String get arcoCarregamentoMaior => _login(nomeIcone: 'arco_carregamento_maior');
  static String get arcoCarregamentoMenor => _login(nomeIcone: 'arco_carregamento_menor');
}