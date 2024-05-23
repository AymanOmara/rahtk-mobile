import 'package:domain/features/auth/entities/forget_password_entity.dart';
import 'package:get_it/get_it.dart';
import 'package:rahtk_mobile/features/app/app_cubit.dart';
import 'package:rahtk_mobile/features/auth/email_verification/business_logic/email_verification_cubit.dart';
import 'package:rahtk_mobile/features/auth/forget_password/business_logic/forget_password_cubit.dart';
import 'package:rahtk_mobile/features/auth/login/business_logic/login_cubit.dart';
import 'package:rahtk_mobile/features/auth/registration/business_logic/registration_cubit.dart';
import 'package:rahtk_mobile/features/auth/verify_otp/business_logic/verify_otp_cubit.dart';
import 'package:rahtk_mobile/features/main/home/business_logic/home_cubit.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display.dart';
import 'package:rahtk_mobile/features/main/navigation_br/business_logic/rahtk_bottom_navigation_bar_cubit.dart';
import 'package:rahtk_mobile/features/on_board/business_logic/on_boarding_cubit.dart';
import 'package:rahtk_mobile/features/products/cart/business_logic/cart_cubit.dart';
import 'package:rahtk_mobile/features/products/favorites/business_logic/favorites_cubit.dart';
import 'package:rahtk_mobile/features/products/product_details/business_logic/product_details_cubit.dart';

var getIt = GetIt.I;

Future<void> initializeDependencies(GetIt diInjector) async {
  getIt.registerFactory(() => AppCubit(diInjector()));
  getIt.registerSingleton(RahtkBottomNavigationBarCubit());
  /// ********* Auth **********
  getIt.registerFactory(() => LoginCubit(diInjector()));
  getIt.registerFactory(() => EmailVerificationCubit(diInjector()));
  getIt.registerFactoryParam((param1, param2) => VerifyOtpCubit(param1 as String,diInjector()));
  getIt.registerFactory(() => RegistrationCubit(diInjector()));
  getIt.registerFactoryParam((param1, param2) => ForgetPasswordCubit(param1 as ForgetPasswordEntity,diInjector()));

  /// ********* Home **********
  getIt.registerFactory(() => HomeCubit(diInjector()));

  /// ********* OnBoarding **********
  getIt.registerFactory(() => OnBoardingCubit(diInjector()));

  /// ********* Favorites **********
  getIt.registerFactory(() => FavoritesCubit(diInjector()));

  /// ********* Product **********
  getIt.registerFactoryParam((param1, param2)=> ProductDetailsCubit((param1 as ProductDisplay).id,diInjector(),diInjector(),diInjector()));
  getIt.registerSingleton(CartCubit());

}
