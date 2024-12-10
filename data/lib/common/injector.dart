import 'package:data/locale/user_local.dart';
import 'package:data/network/base_api.dart';
import 'package:data/network/i_base_api.dart';
import 'package:data/network/interceptor/header_interceptor.dart';
import 'package:data/network/interceptor/refresh_token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:domain/locale_storage/i_user_local.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

Future<void> initializeDataInjector(GetIt injector) async {
  await GetStorage.init();
  injector.registerSingleton(GetStorage());
  var dio = setUpInterceptors(injector);
  injector.registerSingleton(dio);
  injector.registerSingleton<IUserLocal>(UserLocal(injector()));
  injector.registerSingleton<IAPIService>(BaseApi(
    injector(),
    injector(),
  ));
}

Dio setUpInterceptors(GetIt injector) {
  var dio = Dio();
  injector.registerSingleton(
    HeaderInterceptor(injector()),
  );
  injector.registerSingleton(RefreshTokenInterceptor(
    dio,
    injector(),
    injector(),
  ));
  dio.interceptors.addAll([
    injector<RefreshTokenInterceptor>(),
    injector<HeaderInterceptor>(),
  ]);
  return dio;
}
