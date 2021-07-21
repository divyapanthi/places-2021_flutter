import 'package:placess_2021/src/core/constants/app_constants.dart';
import 'package:placess_2021/src/model/user_model.dart';
import 'package:placess_2021/src/services/auth_rx_provider.dart';
import 'package:placess_2021/src/services/local/cache_provider.dart';
import 'package:placess_2021/src/services/local/db_provider.dart';

class SplashService{
  final CacheProvider cacheProvider;
  final DbProvider dbProvider;
  final AuthRxProvider authRxProvider;

  SplashService({
      required this.cacheProvider,
      required this.dbProvider,
      required this.authRxProvider});

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;


  Future<void> initialize() async{
    UserModel? user = await dbProvider.getUser();
    if(user == null){
      // the user has not logged in yet
      return;
    }
    String? token = await cacheProvider.getStringValue(TOKEN_KEY);
    if(token == null){
      // the user has not logged in yet
      return;
    }

    authRxProvider.addToken(token);
    authRxProvider.addUser(user);
    _isLoggedIn = true;
  }

}