import 'dart:io';

import 'package:di/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/features/app/app_cubit.dart';
import 'package:rahtk_mobile/firebase_options.dart';

import 'app_router.dart';
import 'core/helper/fire_base_helper.dart';
import 'core/helper/injector.dart';
import 'core/translation_service/translation_service.dart';
import 'core/ui/theme/light_mode.dart';
import 'features/main/bar_icons/business_logic/bar_icons_cubit.dart';
import 'features/main/navigation_br/business_logic/rahtk_bottom_navigation_bar_cubit.dart';
import 'features/order/cart/business_logic/cart_cubit.dart';
import 'features/products/favorites/business_logic/favorites_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI.registerDependencies();
  await initializeDependencies(diInjector);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseNotifications().initNotification();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()?.restartApp();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        key: key,
        providers: [
          BlocProvider(
            create: (_) => getIt<RahtkBottomNavigationBarCubit>(),
          ),
          BlocProvider(
            create: (_) => getIt<FavoritesCubit>(),
          ),
          BlocProvider(
            create: (_) => getIt<CartCubit>(),
          ),
          BlocProvider(
            create: (_) => getIt<BarIconsCubit>(),
          ),
        ],
        child: BlocProvider(
          create: (context) => getIt<AppCubit>(),
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
                locale: Get.locale ??
                    Locale(
                      cubit.userStatusEntity?.locale ?? 'en',
                    ),
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
      ),
    );
  }

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
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
