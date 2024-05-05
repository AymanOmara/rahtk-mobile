library di;

import 'package:data/common/injector.dart';
import 'package:di/repositories_injector.dart';
import 'package:di/use_case_injector.dart';
import 'package:get_it/get_it.dart';

var diInjector = GetIt.I;

class DI {
  static Future<void> registerDependencies() async {
    await initializeDataInjector(diInjector);
    await setupRepositoryInjector(diInjector);
    await setupUseCaseInjector(diInjector);
  }

  DI._();
}
