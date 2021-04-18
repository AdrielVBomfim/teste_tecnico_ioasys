import 'package:meta/meta.dart';

abstract class IHeadersRepository {
  Future<void> gravarHeaders({
    @required String uid,
    @required String client,
    @required String accessToken,
  });

  Future<Map<String, String>> lerHeaders();
}
