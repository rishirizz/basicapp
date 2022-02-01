/* LOGIN SERVICE */

import 'dart:convert';
import 'package:basicapp/api_models/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    Uri url = Uri.parse("https://reqres.in/api/login");

    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}

/* SHARED SERVICE */

class SharedService {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("login_details") != null ? true : false;
  }

  static Future<void> setLoginDetails(LoginResponseModel? loginResponse) async {
    final prefs = await SharedPreferences.getInstance();
    if (loginResponse != null) {
      prefs.setString("login_details", jsonEncode(loginResponse.toJson()));
    }
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('login_details');
  }
}
