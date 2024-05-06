import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/features/app/app_cubit.dart';

import 'app_router.dart';
import 'core/helper/injector.dart';
import 'core/translation_service/translation_service.dart';
import 'core/ui/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI.registerDependencies();
  await initializeDependencies();
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
