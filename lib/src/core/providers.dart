import 'package:flutter/cupertino.dart';
import 'package:placess_2021/src/api/auth_api.dart';
import 'package:placess_2021/src/services/auth/login_service.dart';
import 'package:placess_2021/src/services/dashboard/dashboard_service.dart';
import 'package:provider/provider.dart';

final providers = [
  ...independentProviders,
  ...dependentProviders,
];

final independentProviders = [
  Provider.value(
    value: AuthApi(),
  ),
];

final dependentProviders = [
  ProxyProvider<AuthApi, LoginService>(
      update: (BuildContext context, AuthApi api, LoginService? service){
        return LoginService(api: api);
      }),

  ProxyProvider<AuthApi, DashboardService>(
      update: (BuildContext context, AuthApi api, DashboardService? service){
        return DashboardService(api: api);
      }),
] ;