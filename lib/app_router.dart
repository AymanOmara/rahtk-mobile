import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/helper/injector.dart';
import 'package:rahtk_mobile/features/auth/login/business_logic/login_cubit.dart';
import 'package:rahtk_mobile/features/auth/login/presentation/page/login_page.dart';
import 'package:rahtk_mobile/features/home/business_logic/home_cubit.dart';
import 'package:rahtk_mobile/features/home/presentation/page/home_page.dart';

import 'features/on_board/presentation/page/on_board_page.dart';

class AppRouter {
  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<LoginCubit>(),
            child: LoginPage(),
          ),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<HomeCubit>(),
            child: const HomePage(),
          ),
        );
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardPage(),
        );
    }
    return null;
  }
}
