import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/main/navigation_br/business_logic/rahtk_bottom_navigation_bar_cubit.dart';
import 'package:rahtk_mobile/features/main/navigation_br/display/rahtk_bottom_navigation_bar_display.dart';

class RahtkBottomNavigationBarItem extends StatelessWidget {
  const RahtkBottomNavigationBarItem({
    super.key,
    required this.display,
    required this.totalCount,
    required this.index,
  });

  final RahtkBottomNavigationBarDisplay display;
  final int totalCount;
  final int index;

  @override
  Widget build(BuildContext context) {
    RahtkBottomNavigationBarCubit cubit = context.watch();
    return InkWell(
      onTap: () {
        cubit.updateCurrentIndex(index);
        display.onTap();
      },
      child: SizedBox(
        width: Get.width / totalCount,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            SvgPicture.asset(
              display.iconPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                cubit.state == index
                    ? RahtkColors.tealColor
                    : RahtkColors.darkGray.withOpacity(0.4),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              display.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight:
                    cubit.state == index ? FontWeight.w700 : FontWeight.w500,
                color: cubit.state == index
                    ? RahtkColors.tealColor
                    : RahtkColors.darkGray.withOpacity(0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
