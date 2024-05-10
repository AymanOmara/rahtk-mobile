import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/features/main/navigation_br/business_logic/rahtk_bottom_navigation_bar_cubit.dart';
import 'package:rahtk_mobile/features/main/navigation_br/display/rahtk_bottom_navigation_bar_display.dart';
import 'package:rahtk_mobile/features/main/navigation_br/presentation/rahtk_bottom_navigation_bar_item.dart';

class RahtkBottomNavigationBar extends StatelessWidget {
  const RahtkBottomNavigationBar({
    super.key,
    required this.items,
    required this.onTap,
  });

  final List<RahtkBottomNavigationBarDisplay> items;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RahtkBottomNavigationBarCubit, int>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsetsDirectional.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: items
                .asMap()
                .entries
                .map(
                  (e) => RahtkBottomNavigationBarItem(
                    display: e.value,
                    totalCount: items.length,
                    index: e.key,
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
