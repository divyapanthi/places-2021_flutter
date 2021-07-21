import 'package:placess_2021/src/core/base_view_model.dart';
import 'package:placess_2021/src/services/splash_service.dart';

class SplashViewModel extends BaseViewModel{
  final SplashService service;

  SplashViewModel({required this.service});

  bool get isLoggedIn => service.isLoggedIn;

  Future<void> initialize() async{
    await service.initialize();
  }


}