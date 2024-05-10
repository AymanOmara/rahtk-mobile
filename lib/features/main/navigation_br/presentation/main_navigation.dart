import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/features/main/browse/presentation/page/browse_page.dart';
import 'package:rahtk_mobile/features/main/home/presentation/page/home_page.dart';
import 'package:rahtk_mobile/features/main/navigation_br/business_logic/rahtk_bottom_navigation_bar_cubit.dart';
import 'package:rahtk_mobile/features/main/navigation_br/display/rahtk_bottom_navigation_bar_display.dart';
import 'package:rahtk_mobile/features/main/navigation_br/presentation/rahtk_bottom_navigation_bar.dart';
import 'package:rahtk_mobile/features/main/order_history/presentation/page/order_history_page.dart';
import 'package:rahtk_mobile/features/main/profile/presentation/page/profile_page.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: RahtkBottomNavigationBar(
        onTap: (index) {},
        items: [
          RahtkBottomNavigationBarDisplay(
            title: "home".tr,
            onTap: () {},
            iconPath: "assets/images/home_ic.svg",
          ),
          RahtkBottomNavigationBarDisplay(
            title: "browse".tr,
            onTap: () {},
            iconPath: "assets/images/browse_ic.svg",
          ),
          RahtkBottomNavigationBarDisplay(
            title: "order_history".tr,
            onTap: () {},
            iconPath: "assets/images/order_history_ic.svg",
          ),
          RahtkBottomNavigationBarDisplay(
            title: "profile".tr,
            onTap: () {},
            iconPath: "assets/images/profile_ic.svg",
          ),
        ],
      ),
      body: getBody(context.watch<RahtkBottomNavigationBarCubit>().state),
    );
  }

  Widget getBody(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const BrowsePage();
      case 2:
        return const OrderHistoryPage();
      case 3:
        return const ProfilePage();
      default:
        return Container();
    }
  }
}
