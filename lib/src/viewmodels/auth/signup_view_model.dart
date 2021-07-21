import 'package:flutter/material.dart';
import 'package:placess_2021/src/core/base_view_model.dart';
import 'package:placess_2021/src/services/auth/auth_service.dart';

class SignupViewModel extends BaseViewModel{

  final AuthService authService;
  SignupViewModel({required this.authService});
  String get errorMessage => authService.errorMessage;

  Future<bool> signup(String name, String phone, String email, String password) async{
    setBusy(true);
    final response = await authService.signup(name, phone, email, password);
    setBusy(false);
    return response;
  }

}