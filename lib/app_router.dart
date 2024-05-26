import 'package:domain/features/auth/entities/forget_password_entity.dart';
import 'package:domain/features/order/entity/address_entity.dart';
import 'package:domain/features/order/entity/payment_option_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/helper/injector.dart';
import 'package:rahtk_mobile/features/address/add_new_address/business_logic/add_address_cubit.dart';
import 'package:rahtk_mobile/features/auth/email_verification/presentation/page/email_verification_page.dart';
import 'package:rahtk_mobile/features/auth/login/business_logic/login_cubit.dart';
import 'package:rahtk_mobile/features/auth/login/presentation/page/login_page.dart';
import 'package:rahtk_mobile/features/auth/registration/business_logic/registration_cubit.dart';
import 'package:rahtk_mobile/features/auth/verify_otp/presentation/page/verify_otp_page.dart';
import 'package:rahtk_mobile/features/main/home/display/category_display.dart';
import 'package:rahtk_mobile/features/on_board/business_logic/on_boarding_cubit.dart';
import 'package:rahtk_mobile/features/order/payment/add_payment/business_logic/add_payment_option_cubit.dart';
import 'package:rahtk_mobile/features/order/payment/add_payment/presentation/page/add_payment_page.dart';
import 'package:rahtk_mobile/features/products/category_products/presentation/page/category_products_page.dart';
import 'package:rahtk_mobile/features/order/payment/choose_payment_option/business_logic/choose_payment_option_cubit.dart';
import 'package:rahtk_mobile/features/products/product_details/business_logic/product_details_cubit.dart';

import 'core/display/i_add_able.dart';
import 'features/address/add_new_address/presentation/page/add_address_page.dart';
import 'features/auth/email_verification/business_logic/email_verification_cubit.dart';
import 'features/auth/forget_password/business_logic/forget_password_cubit.dart';
import 'features/auth/forget_password/presentation/page/forget_password_page.dart';
import 'features/auth/registration/presentation/page/registration_page.dart';
import 'features/auth/verify_otp/business_logic/verify_otp_cubit.dart';
import 'features/main/home/business_logic/home_cubit.dart';
import 'features/main/home/display/product_display.dart';
import 'features/main/navigation_br/presentation/main_navigation.dart';
import 'features/on_board/presentation/page/on_board_page.dart';
import 'features/order/cart/presentation/page/cart_page.dart';
import 'features/order/order_success/order_success_params_display.dart';
import 'features/order/order_success/presentation/page/order_success_page.dart';
import 'features/order/payment/choose_payment_option/display/choose_payment_option_params.dart';
import 'features/products/favorites/presentation/page/favorite_page.dart';
import 'features/order/payment/choose_payment_option/presentation/page/choose_payment_option_page.dart';
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
      case AppRoutes.addAddress:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AddAddressCubit>(
              param1: settings.arguments as IAddAble<AddressEntity>,
            ),
            child: AddAddressPage(),
          ),
        );
      case AppRoutes.paymentOptions:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ChoosePaymentOptionCubit>(
              param1: settings.arguments as ChoosePaymentOptionParams,
            ),
            child: const ChoosePaymentOptionPage(),
          ),
        );
      case AppRoutes.addPayment:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AddPaymentOptionCubit>(
              param1: settings.arguments as IAddAble<PaymentOptionEntity>,
            ),
            child: AddPaymentPage(),
          ),
        );
      case AppRoutes.orderSuccess:
        return MaterialPageRoute(
          builder: (_) => OrderSuccessPage(
            orderSuccessParamsDisplay:
                settings.arguments as OrderSuccessParamsDisplay,
          ),
        );
    }
    return null;
  }
}
