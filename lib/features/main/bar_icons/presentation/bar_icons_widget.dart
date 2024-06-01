import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/features/main/bar_icons/business_logic/bar_icons_cubit.dart';

class BarIconsWidget extends StatelessWidget {
  const BarIconsWidget({
    super.key,
    required this.isNotificationVisible,
  });

  final bool isNotificationVisible;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarIconsCubit, BarIconsState>(
      builder: (context, state) {
        BarIconsCubit cubit = BlocProvider.of(context);
        return Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.favorites,
                );
              },
              child: SvgPicture.asset(
                "assets/images/favorite_ic.svg",
                colorFilter: ColorFilter.mode(
                  cubit.favorites.isEmpty ? Colors.white : Colors.red,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.cart,
                );
              },
              child: SvgPicture.asset(
                "assets/images/cart_ic.svg",
                colorFilter: ColorFilter.mode(
                 cubit.cartProducts.isEmpty ? Colors.white : Colors.red,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Visibility(
              visible: isNotificationVisible,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.notifications,
                      );
                    },
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                  cubit.notification == 0
                      ? const SizedBox()
                      : Positioned(
                          right: 8,
                          top: 8,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
