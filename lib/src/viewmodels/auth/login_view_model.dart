import 'package:flutter/material.dart';
import 'package:placess_2021/src/core/base_view_model.dart';
import 'package:placess_2021/src/services/auth/auth_service.dart';

class LoginViewModel extends BaseViewModel{

  final AuthService loginService;
  LoginViewModel({required this.loginService});
  String get errorMessage => loginService.errorMessage;

  Future<bool> login(String email, String password) async{
    setBusy(true);
    final response = await loginService.login(email, password);
    setBusy(false);
    return response;
  }

}