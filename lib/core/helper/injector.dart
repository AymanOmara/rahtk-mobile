import 'package:get_it/get_it.dart';
import 'package:rahtk_mobile/features/app/app_cubit.dart';
import 'package:rahtk_mobile/features/auth/email_verification/business_logic/email_verification_cubit.dart';
import 'package:rahtk_mobile/features/auth/login/business_logic/login_cubit.dart';
import 'package:rahtk_mobile/features/auth/registration/business_logic/registration_cubit.dart';
import 'package:rahtk_mobile/features/auth/verify_otp/business_logic/verify_otp_cubit.dart';
import 'package:rahtk_mobile/features/home/business_logic/home_cubit.dart';
import 'package:rahtk_mobile/features/on_board/business_logic/on_boarding_cubit.dart';

var getIt = GetIt.I;

Future<void> initializeDependencies(GetIt diInjector) async {
  getIt.registerFactory(() => AppCubit(diInjector()));

  /// ********* Auth **********
  getIt.registerFactory(() => LoginCubit(diInjector()));
  getIt.registerFactory(() => EmailVerificationCubit(diInjector()));
  getIt.registerFactoryParam((param1, param2) => VerifyOtpCubit(param1 as String,diInjector()));
  getIt.registerFactory(() => RegistrationCubit(diInjector()));

  /// ********* Home **********
  getIt.registerFactory(() => HomeCubit());

  /// ********* OnBoarding **********
  getIt.registerFactory(() => OnBoardingCubit(diInjector()));

}
