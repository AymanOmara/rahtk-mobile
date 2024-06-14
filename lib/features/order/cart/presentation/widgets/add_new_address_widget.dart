import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/features/order/cart/business_logic/cart_cubit.dart';

class AddNewAddressWidget extends StatelessWidget {
  const AddNewAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CartCubit cubit = context.watch<CartCubit>();
    return cubit.address == null
        ? InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRoutes.addAddress,
                arguments: cubit,
              );
            },
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    color: RahtkColors.darkGray,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "add_new_address".tr,
                    style: const TextStyle(
                      fontSize: 18,
                      color: RahtkColors.darkGray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container(
            color: Colors.white,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    cubit.address.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: RahtkColors.darkGray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.addAddress,
                      arguments: cubit,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                      color: RahtkColors.tealColor,
                    ),
                    child: Text(
                      "change".tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
