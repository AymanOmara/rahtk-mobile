import 'package:di/di.dart';
import 'package:get_it/get_it.dart';
import 'package:rahtk_mobile/features/app/app_cubit.dart';
import 'package:rahtk_mobile/features/auth/login/business_logic/login_cubit.dart';
import 'package:rahtk_mobile/features/home/business_logic/home_cubit.dart';

var getIt = GetIt.I;

Future<void> initializeDependencies() async {
  getIt.registerFactory(() => AppCubit(diInjector()));
  /// ********* Auth **********
  getIt.registerFactory(() => LoginCubit());
  /// ********* Home **********
  getIt.registerFactory(() => HomeCubit());
}
