import 'package:data/features/auth/repositories/auth_repository.dart';
import 'package:domain/features/auth/repositories/i_auth_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> setupRepositoryInjector(GetIt diInjector) async {
  /// ********* Auth **********
  diInjector.registerSingleton<IAuthRepository>(AuthRepository(diInjector(),diInjector()));
}