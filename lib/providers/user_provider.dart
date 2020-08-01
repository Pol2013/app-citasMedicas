import 'dart:convert';

import 'package:app_citas/utils/user_preferences.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final _prefs = UserPreferences();

  Future logIn(String documentNumber, String password) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final authData = {
      'document_number': documentNumber,
      'password': password,
    };

    final response = await http.post('http://10.0.2.2:8000/api/auth/login',
        headers: headers, body: json.encode(authData));
    print(json.encode(authData));

    final Map<String, dynamic> responseDecoded = json.decode(response.body);
    print(json.decode(response.body));
    if (responseDecoded['obj'] is List<dynamic>) {
      return {'ok': false};
    } else {
      _prefs.token = responseDecoded['obj']['token'];
      return {'ok': true};
    }
  }

  Future register(
      String name,
      String lastName,
      String lastNameM,
      String documentType,
      String documentNumber,
      String address,
      String phone,
      String email,
      String password,
      String passwordConfirm) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final registerData = {
      "name": name,
      "last_name_p": lastName,
      "last_name_m": lastNameM,
      "document_type_id": 1,
      "document_number": documentNumber,
      "address": address,
      "phone": phone,
      "birthdate": "2000-08-03",
      "email": email,
      "gender": "M",
      "country_id": 1,
      "attorney": "-",
      "patient_type_id": 1,
      "password": password,
      "password_confirmation": passwordConfirm
    };

    final response = await http.post('http://10.0.2.2:8000/api/patient',
        headers: headers, body: json.encode(registerData));
    print(json.encode(registerData));

    final Map<String, dynamic> responseDecoded = json.decode(response.body);
    print(json.decode(response.body));
    if (responseDecoded['obj'] is List<dynamic>) {
      return {'ok': false};
    } else {
      _prefs.token = responseDecoded['obj']['token'];
      return {'ok': true};
    }
  }

  logOut() {
    _prefs.token = '';
  }
}
