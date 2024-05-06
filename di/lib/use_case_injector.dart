import 'package:domain/features/app/use_case/get_user_status_use_case.dart';
import 'package:domain/features/on_boarding/use_case/change_first_launch_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> setupUseCaseInjector(GetIt diInjector) async {
  diInjector.registerFactory(() => GetUserStatusUseCase(diInjector()));
  diInjector.registerFactory(() => ChangeFirstLaunchUseCase(diInjector()));
}
