import 'dart:convert';

import 'package:http/http.dart';
import 'package:placess_2021/src/core/constants/app_url.dart';
import 'package:placess_2021/src/model/user_model.dart';

class AuthApi {
  Future<String> login(String email, String password) async {
    Map<String, dynamic> requestBody = {
      "email": email,
      "password": password
    };
    try {
      var uri = Uri.parse(Appurl.LOGIN_URL);
      final response = await post(
        uri,
        body: jsonEncode(requestBody),
        headers: {"Content-Type": "application/json"},
      );
      final body = response.body;
      print("login response $body");
      // if (response.statusCode != 200) return null;
      final parsed = jsonDecode(body);

      if(parsed["token"]==null){
        throw Exception(parsed["error"] ?? "Could not login with the credential provided");
      }
      return parsed["token"];

    } catch (e) {
      print("login exception $e");
      throw Exception("$e");
    }
  }

  Future<UserModel?> register(
      String name, String phone, String email, String password) async {
    Map<String, dynamic> requestBody = {
      "email": email,
      "password": password,
      "name": name,
      "phone": phone,
    };
    try {
      var uri = Uri.parse("https://api.fresco-meat.com/api/albums/signup");
      final response = await post(
        uri,
        body: jsonEncode(requestBody),
        headers: {"Content-Type": "application/json"},
      );
      final body = response.body;
      print("Signup response $body");
      if (response.statusCode != 201) return null;
      final parsedMap = jsonDecode(body);
      final user = UserModel.fromJson(parsedMap);
      return user;
    } catch (e) {
      print("Signup exception $e");
      return null;
    }
  }
}
