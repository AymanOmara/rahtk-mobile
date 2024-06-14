import 'package:domain/features/auth/entities/forget_password_entity.dart';
import 'package:domain/features/order/entity/address_entity.dart';
import 'package:domain/features/order/entity/payment_option_entity.dart';
import 'package:domain/features/reminder/entity/reminder_entity.dart';
import 'package:get_it/get_it.dart';
import 'package:rahtk_mobile/core/display/i_add_able.dart';
import 'package:rahtk_mobile/features/address/add_new_address/business_logic/add_address_cubit.dart';
import 'package:rahtk_mobile/features/app/app_cubit.dart';
import 'package:rahtk_mobile/features/auth/email_verification/business_logic/email_verification_cubit.dart';
import 'package:rahtk_mobile/features/auth/forget_password/business_logic/forget_password_cubit.dart';
import 'package:rahtk_mobile/features/auth/login/business_logic/login_cubit.dart';
import 'package:rahtk_mobile/features/auth/registration/business_logic/registration_cubit.dart';
import 'package:rahtk_mobile/features/auth/verify_otp/business_logic/verify_otp_cubit.dart';
import 'package:rahtk_mobile/features/main/bar_icons/business_logic/bar_icons_cubit.dart';
import 'package:rahtk_mobile/features/main/home/business_logic/home_cubit.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display.dart';
import 'package:rahtk_mobile/features/main/navigation_br/business_logic/rahtk_bottom_navigation_bar_cubit.dart';
import 'package:rahtk_mobile/features/main/order_history/business_logic/order_history_cubit.dart';
import 'package:rahtk_mobile/features/notifications/business_logic/notifications_cubit.dart';
import 'package:rahtk_mobile/features/on_board/business_logic/on_boarding_cubit.dart';
import 'package:rahtk_mobile/features/order/cart/business_logic/cart_cubit.dart';
import 'package:rahtk_mobile/features/order/payment/add_payment/business_logic/add_payment_option_cubit.dart';
import 'package:rahtk_mobile/features/order/payment/choose_payment_option/display/choose_payment_option_params.dart';
import 'package:rahtk_mobile/features/products/favorites/business_logic/favorites_cubit.dart';
import 'package:rahtk_mobile/features/order/payment/choose_payment_option/business_logic/choose_payment_option_cubit.dart';
import 'package:rahtk_mobile/features/products/product_details/business_logic/product_details_cubit.dart';
import 'package:rahtk_mobile/features/reminders/get_reminders/business_logic/get_reminders_cubit.dart';
import 'package:rahtk_mobile/features/reminders/update_reminder/business_logic/update_reminder_cubit.dart';
import 'package:rahtk_mobile/features/reminders/update_reminder/display/update_reminder_display.dart';

import '../../features/reminders/add_reminder/business_logic/add_reminder_cubit.dart';

var getIt = GetIt.I;

Future<void> initializeDependencies(GetIt diInjector) async {
  getIt.registerFactory(() => AppCubit(diInjector()));
  getIt.registerFactory(() => RahtkBottomNavigationBarCubit());
  getIt.registerLazySingleton(() => BarIconsCubit(diInjector()));

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
  getIt.registerFactoryParam((param1, param2)=> ProductDetailsCubit((param1 as ProductDisplay).id,diInjector(),diInjector(),diInjector(),diInjector()));
  getIt.registerFactory(() =>CartCubit(diInjector()));
  getIt.registerFactoryParam((param1, param2)=> AddAddressCubit(diInjector(),param1 as IAddAble<AddressEntity>));

  /// ********* Order **********
  getIt.registerFactoryParam((param1, param2)=> ChoosePaymentOptionCubit(param1 as ChoosePaymentOptionParams,diInjector(),diInjector()));
  getIt.registerFactoryParam((param1, param2)=> AddPaymentOptionCubit(diInjector(),param1 as IAddAble<PaymentOptionEntity>));
  getIt.registerFactory(()=> OrderHistoryCubit(diInjector()));

  /// ********* Reminders **********
  getIt.registerFactory(()=> GetRemindersCubit(diInjector()));
  getIt.registerFactoryParam((p1, p2)=> AddReminderCubit(p1 as IAddAble<ReminderEntity>,diInjector(),diInjector()));
  getIt.registerFactoryParam((p1, p2)=> UpdateReminderCubit(p1 as UpdateReminderDisplay,diInjector(),diInjector(),diInjector()));

  /// ********* Notifications **********
  getIt.registerFactory(()=> NotificationsCubit(diInjector()));
}
