import 'package:domain/features/app/use_case/get_user_status_use_case.dart';
import 'package:domain/features/auth/use_case/email_verification_use_case.dart';
import 'package:domain/features/auth/use_case/forget_password_use_case.dart';
import 'package:domain/features/auth/use_case/login_use_case.dart';
import 'package:domain/features/auth/use_case/register_fcm_token_use_case.dart';
import 'package:domain/features/auth/use_case/registration_use_case.dart';
import 'package:domain/features/auth/use_case/verify_otp_use_case.dart';
import 'package:domain/features/on_boarding/use_case/change_first_launch_use_case.dart';
import 'package:domain/features/order/use_case/add_payment_use_case.dart';
import 'package:domain/features/order/use_case/create_address_use_case.dart';
import 'package:domain/features/order/use_case/create_order_use_case.dart';
import 'package:domain/features/order/use_case/get_address_use_case.dart';
import 'package:domain/features/order/use_case/get_orders_use_case.dart';
import 'package:domain/features/order/use_case/get_payments_use_case.dart';
import 'package:domain/features/product/use_case/add_to_favorite_use_case.dart';
import 'package:domain/features/product/use_case/get_all_products_use_case.dart';
import 'package:domain/features/product/use_case/get_categories_use_case.dart';
import 'package:domain/features/product/use_case/get_favorites_use_case.dart';
import 'package:domain/features/product/use_case/get_product_details_use_case.dart';
import 'package:domain/features/product/use_case/remove_from_favorite_use_case.dart';
import 'package:domain/features/profile/use_case/change_language_use_case.dart';
import 'package:domain/features/profile/use_case/get_notifications_use_case.dart';
import 'package:domain/features/profile/use_case/get_profile_info_use_case.dart';
import 'package:domain/features/profile/use_case/logout_use_case.dart';
import 'package:domain/features/reminder/use_case/add_periodically_reminder_use_case.dart';
import 'package:domain/features/reminder/use_case/delete_reminder_use_case.dart';
import 'package:domain/features/reminder/use_case/get_reminders_use_case.dart';
import 'package:domain/features/reminder/use_case/update_reminder_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> setupUseCaseInjector(GetIt diInjector) async {

  /// ********* Auth **********
  diInjector.registerFactory(() => GetUserStatusUseCase(diInjector()));
  diInjector.registerFactory(() => ChangeFirstLaunchUseCase(diInjector()));
  diInjector.registerFactory(() => LoginUseCase(diInjector()));
  diInjector.registerFactory(() => EmailVerificationUseCase(diInjector()));
  diInjector.registerFactory(() => RegistrationUseCase(diInjector()));
  diInjector.registerFactory(() => VerifyOtpUseCase(diInjector()));
  diInjector.registerFactory(() => ForgetPasswordUseCase(diInjector()));
  diInjector.registerFactory(() => RegisterFcmTokenUseCase(diInjector()));

  /// ********* Product **********
  diInjector.registerFactory(() => GetCategoriesUseCase(diInjector()));
  diInjector.registerFactory(() => GetFavoritesUseCase(diInjector()));
  diInjector.registerFactory(() => AddToFavoriteUseCase(diInjector()));
  diInjector.registerFactory(() => RemoveFavoriteUseCase(diInjector()));
  diInjector.registerFactory(() => GetProductDetailsUseCase(diInjector()));
  diInjector.registerFactory(() => GetAllProductsUseCase(diInjector()));

  /// ********* Order **********
  diInjector.registerFactory(()=> CreateAddressUseCase(diInjector()));
  diInjector.registerFactory(()=> GetAddressUseCase(diInjector()));
  diInjector.registerFactory(()=> GetPaymentsUseCase(diInjector()));
  diInjector.registerFactory(()=> AddPaymentUseCase(diInjector()));
  diInjector.registerFactory(()=> CreateOrderUseCase(diInjector()));
  diInjector.registerFactory(()=> GetOrdersUseCase(diInjector()));

  /// ********* Profile **********
  diInjector.registerFactory(()=> GetProfileInfoUseCase(diInjector()));
  diInjector.registerFactory(()=> ChangeLanguageUseCase(diInjector()));
  diInjector.registerFactory(()=> GetNotificationsUseCase(diInjector()));
  diInjector.registerFactory(()=> LogoutUseCase(diInjector()));

  /// ********* Reminders **********
  diInjector.registerFactory(()=> GetRemindersUseCase(diInjector()));
  diInjector.registerFactory(()=> AddPeriodicallyReminderUseCase(diInjector()));
  diInjector.registerFactory(()=> UpdateReminderUseCase(diInjector()));
  diInjector.registerFactory(()=> DeleteReminderUseCase(diInjector()));


}
