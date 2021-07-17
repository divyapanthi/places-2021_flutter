import 'package:placess_2021/src/api/auth_api.dart';

class LoginService{
  // final api = AuthApi();
  //Implementing Dependency Injection
  final AuthApi api;
  LoginService({required this.api});

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    try{
      String token = await api.login(email, password);
      return true;
    // fetch user profile, save in our local database, save token in local cache
    }catch(e){
      _errorMessage = "$e".replaceAll("Exception", "");
      return false;
    }
  }
}