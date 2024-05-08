import 'package:domain/features/app/use_case/get_user_status_use_case.dart';
import 'package:domain/features/auth/use_case/email_verification_use_case.dart';
import 'package:domain/features/auth/use_case/forget_password_use_case.dart';
import 'package:domain/features/auth/use_case/login_use_case.dart';
import 'package:domain/features/auth/use_case/registration_use_case.dart';
import 'package:domain/features/auth/use_case/verify_otp_use_case.dart';
import 'package:domain/features/on_boarding/use_case/change_first_launch_use_case.dart';
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
}
