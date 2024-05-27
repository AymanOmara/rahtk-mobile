import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/main/home/business_logic/home_cubit.dart';
import 'package:rahtk_mobile/features/main/home/presentation/widgets/product_widget.dart';

class NewArrivalProducts extends StatelessWidget {
  const NewArrivalProducts({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.watch<HomeCubit>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "new_product".tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: 100,
                decoration: BoxDecoration(
                  color: RahtkColors.tealColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "see_all".tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                cubit.products.reversed.take(3).map((e) => ProductWidget(product: e)).toList(),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
