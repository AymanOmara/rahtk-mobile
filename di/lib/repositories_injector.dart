import 'package:data/features/auth/repositories/auth_repository.dart';
import 'package:data/features/order/repositories/order_repository.dart';
import 'package:data/features/products/repository/product_repository.dart';
import 'package:domain/features/auth/repositories/i_auth_repository.dart';
import 'package:domain/features/order/repository/i_order_repository.dart';
import 'package:domain/features/product/repository/i_product_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> setupRepositoryInjector(GetIt diInjector) async {
  /// ********* Auth **********
  diInjector.registerSingleton<IAuthRepository>(AuthRepository(diInjector(),diInjector()));

  /// ********* Products **********
  diInjector.registerSingleton<IProductRepository>(ProductRepository(diInjector()));

  /// ********* Order **********
  diInjector.registerSingleton<IOrderRepository>(OrderRepository(diInjector()));

}