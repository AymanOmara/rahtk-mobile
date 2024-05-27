import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_btn.dart';
import 'package:rahtk_mobile/core/ui/rahtk_navigation_bar.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/pharmacy/drug_details/business_logic/drug_details_cubit.dart';

class DrugDetailsPage extends StatelessWidget {
  const DrugDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrugDetailsCubit, DrugDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        DrugDetailsCubit cubit = BlocProvider.of(context);
        return Scaffold(
          backgroundColor: RahtkColors.aliceBlue,
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              RahtkNavigationBar(
                title: "title".tr,
                height: 100,
              ),
              Stack(
                children: [
                  Opacity(
                    opacity: 1,
                    child: CachedNetworkImage(
                      imageUrl: "${Common.baseUrl}${cubit.drugEntity.image}",
                      width: Get.width,
                      height: 220,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(),
                        ],
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(
                                0.4,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              "assets/images/back_ic.svg",
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "add_periodically_reminder_note".tr,
                              style: const TextStyle(
                                color: RahtkColors.darkGray,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextFormField(
                              onChanged: (txt){
                                cubit.duration = txt;
                              },
                              keyboardType: TextInputType.number,
                              decoration: inputDecoration("period_in_days".tr),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              RahtkLoadingButton(
                loadingState: cubit.loadingState,
                child: InkWell(
                  onTap: (){
                    cubit.submit();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width - 20,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: RahtkColors.tealColor,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Text(
                      "save".tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }

  InputBorder border() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: RahtkColors.lightGrayish,
      ),
    );
  }

  InputDecoration inputDecoration(String hintText) {
    return InputDecoration(
      labelText: hintText,
      hintText: hintText,
      hintStyle: const TextStyle(
        color: RahtkColors.darkGray,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      labelStyle: const TextStyle(
        color: RahtkColors.darkGray,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      border: border(),
      disabledBorder: border(),
      enabledBorder: border(),
      focusedBorder: border(),
    );
  }
}
