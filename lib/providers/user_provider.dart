import 'dart:convert';

import 'package:app_citas/utils/user_preferences.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final _prefs = UserPreferences();

  Future login(String email, String password) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final authData = {
      'email': email,
      'password': password,
    };

    final response = await http.post('http://10.0.2.2:8000/api/auth/login',
        headers: headers, body: json.encode(authData));

    final Map<String, dynamic> responseDecoded = json.decode(response.body);

    if (responseDecoded['obj'] is List<dynamic>) {
      return {'ok': false};
    } else {
      _prefs.token = responseDecoded['obj']['token'];
      return {'ok': true};
    }
  }
}
