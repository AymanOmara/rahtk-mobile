import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/core/helper/utils.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_btn.dart';
import 'package:rahtk_mobile/core/ui/page_header.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/features/reminders/common/presentation/reminder_product_widget.dart';
import 'package:rahtk_mobile/features/reminders/update_reminder/business_logic/update_reminder_cubit.dart';

class UpdateReminderPage extends StatelessWidget {
  UpdateReminderPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateReminderCubit, UpdateReminderState>(
      listener: (context, state) {
        if (state is UpdateReminderResult) {
          if (state.success) {
            Navigator.of(context).pop();
            Get.snackbar(
              "success".tr,
              state.message,
              snackPosition: SnackPosition.BOTTOM,
            );
          } else {
            Get.snackbar(
              "error".tr,
              state.message,
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        }
      },
      builder: (context, state) {
        UpdateReminderCubit cubit = BlocProvider.of(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              PageHeader(
                title: "update_reminder".tr,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      fillOverscroll: true,
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "select_products".tr,
                              ),
                            ],
                          ),
                          Wrap(
                            children: cubit.products
                                .map((e) => ReminderProductWidget(
                                      product: e,
                                      onPress: (product) {
                                        cubit.selectProduct(product);
                                      },
                                    ))
                                .toList(),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  initialValue: cubit.reminder.title,
                                  validator: (txt) {
                                    return Validator.validateRequired(txt);
                                  },
                                  decoration: inputDecoration(
                                    "title".tr,
                                  ),
                                  onChanged: (txt) {
                                    cubit.reminder.title = txt;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  initialValue:
                                      cubit.reminder.timeInterval.toString(),
                                  keyboardType: TextInputType.number,
                                  validator: (txt) {
                                    return Validator.validateRequired(txt);
                                  },
                                  decoration: inputDecoration(
                                    "period_in_days".tr,
                                  ),
                                  onChanged: (txt) {
                                    cubit.reminder.timeInterval =
                                        int.tryParse(txt) ?? 0;
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: RahtkLoadingButton(
                                        loadingState: cubit.reminderLoading,
                                        child: InkWell(
                                          onTap: () {
                                            cubit.deleteReminder();
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            // width: Get.width - 50,
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
                                              "delete_reminder".tr,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20,),
                                    Expanded(
                                      child: RahtkLoadingButton(
                                        loadingState: cubit.reminderLoading,
                                        child: InkWell(
                                          onTap: () {
                                            if (!_formKey.currentState!
                                                .validate()) {
                                              return;
                                            }
                                            cubit.updateReminder();
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
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
                                              "update_reminder".tr,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).padding.bottom + 20,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
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
