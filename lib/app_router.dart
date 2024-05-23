import 'package:domain/features/auth/entities/forget_password_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/helper/injector.dart';
import 'package:rahtk_mobile/features/auth/email_verification/presentation/page/email_verification_page.dart';
import 'package:rahtk_mobile/features/auth/login/business_logic/login_cubit.dart';
import 'package:rahtk_mobile/features/auth/login/presentation/page/login_page.dart';
import 'package:rahtk_mobile/features/auth/registration/business_logic/registration_cubit.dart';
import 'package:rahtk_mobile/features/auth/verify_otp/presentation/page/verify_otp_page.dart';
import 'package:rahtk_mobile/features/main/home/display/category_display.dart';
import 'package:rahtk_mobile/features/on_board/business_logic/on_boarding_cubit.dart';
import 'package:rahtk_mobile/features/products/category_products/presentation/page/category_products_page.dart';
import 'package:rahtk_mobile/features/products/product_details/business_logic/product_details_cubit.dart';

import 'features/auth/email_verification/business_logic/email_verification_cubit.dart';
import 'features/auth/forget_password/business_logic/forget_password_cubit.dart';
import 'features/auth/forget_password/presentation/page/forget_password_page.dart';
import 'features/auth/registration/presentation/page/registration_page.dart';
import 'features/auth/verify_otp/business_logic/verify_otp_cubit.dart';
import 'features/main/home/business_logic/home_cubit.dart';
import 'features/main/home/display/product_display.dart';
import 'features/main/navigation_br/presentation/main_navigation.dart';
import 'features/on_board/presentation/page/on_board_page.dart';
import 'features/products/cart/presentation/cart_page.dart';
import 'features/products/favorites/presentation/page/favorite_page.dart';
import 'features/products/product_details/presentation/page/product_details_page.dart';

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
            child: const MainNavigation(),
          ),
        );
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<OnBoardingCubit>(),
            child: OnBoardPage(),
          ),
        );
      case AppRoutes.emailVerification:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<EmailVerificationCubit>(),
            child: EmailVerificationPage(),
          ),
        );
      case AppRoutes.verifyOtp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<VerifyOtpCubit>(
              param1: settings.arguments as String,
            ),
            child: VerifyOtpPage(),
          ),
        );
      case AppRoutes.registration:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<RegistrationCubit>(),
            child: RegistrationPage(),
          ),
        );
      case AppRoutes.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ForgetPasswordCubit>(
              param1: settings.arguments as ForgetPasswordEntity,
            ),
            child: ForgetPasswordPage(),
          ),
        );
      case AppRoutes.categoryProducts:
        return MaterialPageRoute(
          builder: (_) => CategoryProductsPage(
            category: settings.arguments as CategoryDisplay,
          ),
        );
      case AppRoutes.productDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ProductDetailsCubit>(
              param1: settings.arguments as ProductDisplay,
            ),
            child: const ProductDetailsPage(),
          ),
        );
      case AppRoutes.favorites:
        return MaterialPageRoute(
          builder: (_) => const FavoritePage(),
        );
      case AppRoutes.cart:
        return MaterialPageRoute(
          builder: (_) => const CartPage(),
        );
    }
    return null;
  }
}
