import 'package:placess_2021/src/api/auth_api.dart';
import 'package:placess_2021/src/core/constants/app_constants.dart';
import 'package:placess_2021/src/model/user_model.dart';
import 'package:placess_2021/src/services/auth_rx_provider.dart';
import 'package:placess_2021/src/services/local/cache_provider.dart';
import 'package:placess_2021/src/services/local/db_provider.dart';

class LoginService{
  // final api = AuthApi();
  //Implementing Dependency Injection
  final AuthApi api;
  final DbProvider dbProvider;
  final CacheProvider cacheProvider;
  final AuthRxProvider authRxProvider;

  LoginService({
      required this.dbProvider,
      required this.cacheProvider,
      required this.authRxProvider,
      required this.api});

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    try{
      String token = await api.login(email, password);
    // fetch user profile, save in our local database, save token in local cache
      return fetchUserDetail(token);

    }catch(e){
      _errorMessage = "$e".replaceAll("Exception", "");
      return false;
    }
  }

  Future<bool> fetchUserDetail(String token) async {
    try{
      UserModel user = await api.fetchUserDetail(token);
      await dbProvider.insertUser(user);
      await cacheProvider.setStringValue(TOKEN_KEY, token);
      authRxProvider.addToken(token);
      authRxProvider.addUser(user);
      //store in the local
      // store the toke in the cache.
      return true;

    }catch(e){
      _errorMessage = "$e".replaceAll("Exception", "");
      return false;
    }
  }
}