import 'package:flutter/cupertino.dart';
import 'package:placess_2021/src/api/auth_api.dart';
import 'package:placess_2021/src/api/dashboard/explore_api.dart';
import 'package:placess_2021/src/services/auth/auth_service.dart';
import 'package:placess_2021/src/services/auth_rx_provider.dart';
import 'package:placess_2021/src/services/dashboard/dashboard_service.dart';
import 'package:placess_2021/src/services/dashboard/explore_service.dart';
import 'package:placess_2021/src/services/local/cache_provider.dart';
import 'package:placess_2021/src/services/local/db_provider.dart';
import 'package:placess_2021/src/services/splash_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  ...independentProviders,
  ...dependantProviders,
];
final  List<SingleChildWidget>  independentProviders = [
  Provider.value(value: AuthApi()),
  Provider.value(value: ExploreApi()),
  Provider.value(value: DbProvider()),
  Provider.value(value: CacheProvider()),
  Provider.value(value: AuthRxProvider()),
];

final List<SingleChildWidget> dependantProviders = [
  ProxyProvider4<AuthApi, DbProvider, CacheProvider, AuthRxProvider,
      AuthService>(
    update: (BuildContext context,
        AuthApi api,
        DbProvider dbProvider,
        CacheProvider cacheProvider,
        AuthRxProvider authRxProvider,
        AuthService? service) {
      return AuthService(
          api: api,
          authRxProvider: authRxProvider,
          cacheProvider: cacheProvider,
          dbProvider: dbProvider);
    },
  ),



  ProxyProvider3<DbProvider, CacheProvider, AuthRxProvider,
      SplashService>(
    update: (BuildContext context,
        DbProvider dbProvider,
        CacheProvider cacheProvider,
        AuthRxProvider authRxProvider,
        SplashService? service) {
      return SplashService(
          authRxProvider: authRxProvider,
          cacheProvider: cacheProvider,
          dbProvider: dbProvider);
    },
  ),

  ProxyProvider<AuthApi, DashboardService>(
    update: (BuildContext context, AuthApi api, DashboardService? service) {
      return DashboardService(api: api);
    },
  ),
  
  ProxyProvider2<ExploreApi, AuthRxProvider, ExploreService>(
    update: (BuildContext context,
        ExploreApi api, AuthRxProvider authRxProvider, ExploreService? service) {

      return ExploreService(api: api, authRxProvider: authRxProvider);
    },
  ),
];