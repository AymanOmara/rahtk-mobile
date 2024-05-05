import 'package:domain/features/app/use_case/get_user_status_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> setupUseCaseInjector(GetIt diInjector) async {
  diInjector.registerFactory(() => GetUserStatusUseCase(diInjector()));
}
