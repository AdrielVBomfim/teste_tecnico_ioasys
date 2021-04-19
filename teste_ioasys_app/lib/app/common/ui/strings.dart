abstract class Strings {
  static const String bemVindoEmpresas = 'Seja bem vindo ao empresas!';
  static const String email = 'Email';
  static const String senha = 'Senha';
  static const String entrar = 'Entrar';
  static const String credenciaisIncorretas = 'Credenciais incorretas';
  static const String algoInesperadoAconteceu = 'Algo inesperado aconteceu, tente novamente';
  static const String semInternet = 'Não há conexão com a internet, tente novamente mais tardsdfsdfsdfsdfe';
  static const String pesquisePorEmpresa = 'Pesquise por empresa';
  static const String nenhumResultado = 'Nenhum resultado encontrado';

  static String resultadosEncontrados(int quantindade) {
    return '${quantindade.toString().padLeft(2, '0')} resultados encontrados';
  }

  static String urlBaseComEndpoint(String endpoint) {
    return 'https://empresas.ioasys.com.br/$endpoint';
  }
}