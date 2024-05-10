import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/features/main/browse/business_logic/browse_cubit.dart';
import 'package:get/get.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrowseCubit(),
      child: BlocConsumer<BrowseCubit, BrowseState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return SizedBox(
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "browse".tr,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
