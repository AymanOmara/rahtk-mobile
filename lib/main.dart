import 'dart:io';

import 'package:common/common.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paymob_payment/paymob_payment.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/features/app/app_cubit.dart';

import 'app_router.dart';
import 'core/helper/injector.dart';
import 'core/translation_service/translation_service.dart';
import 'core/ui/theme/light_mode.dart';
import 'features/main/navigation_br/business_logic/rahtk_bottom_navigation_bar_cubit.dart';
import 'features/order/cart/business_logic/cart_cubit.dart';
import 'features/products/favorites/business_logic/favorites_cubit.dart';

void main() async {
  PaymobPayment.instance.initialize(
    apiKey: Common.payMobApiKey,
    integrationID: 4583132,
    iFrameID: 728907,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await DI.registerDependencies();
  await initializeDependencies(diInjector);
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt<AppCubit>(),
          ),
          BlocProvider(
            create: (_) => getIt<RahtkBottomNavigationBarCubit>(),
          ),
          BlocProvider(
            create: (_) => getIt<FavoritesCubit>(),
          ),
          BlocProvider(
            create: (_) => getIt<CartCubit>(),
          ),
        ],
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            AppCubit cubit = BlocProvider.of(context);
            return GetMaterialApp(
              title: 'Flutter Demo',
              theme: lightTheme,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              onGenerateRoute: AppRouter().generateRouter,
              translations: TranslationService(),
              supportedLocales: const <Locale>[
                Locale('en'),
                Locale('ar'),
              ],
              locale: Get.locale ?? const Locale('en'),
              localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              initialRoute: cubit.userStatusEntity?.login == true
                  ? AppRoutes.home
                  : cubit.userStatusEntity?.firstRun == true
                      ? AppRoutes.onBoarding
                      : AppRoutes.login,
            );
          },
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
