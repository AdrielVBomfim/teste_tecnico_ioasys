import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeadersDatasource {
  HeadersDatasource() : _prefs = SharedPreferences.getInstance();

  Future<SharedPreferences> _prefs;

  Future<void> gravarHeaders({
    @required String uid,
    @required String client,
    @required String accessToken,
  }) async {
    SharedPreferences prefs = await _prefs;

    prefs.setString('uid', uid);
    prefs.setString('client', client);
    prefs.setString('access-token', accessToken);
  }

  Future<Map<String, String>> lerHeaders() async {
    SharedPreferences prefs = await _prefs;

    return {
      'uid': prefs.getString('uid'),
      'client': prefs.getString('client'),
      'access-token': prefs.getString('access-token'),
    };
  }
}
