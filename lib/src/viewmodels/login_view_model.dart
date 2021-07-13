import 'package:flutter/material.dart';
import 'package:placess_2021/src/core/base_view_model.dart';

class LoginViewModel extends BaseViewModel{

  Future<void> login(String email, String password) async{
    setBusy(true);
    await Future.delayed(Duration(seconds: 3));
    setBusy(false);
  }

}