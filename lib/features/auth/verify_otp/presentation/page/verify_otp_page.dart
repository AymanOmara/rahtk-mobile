import 'package:domain/features/auth/entities/forget_password_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_btn.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/auth/verify_otp/business_logic/verify_otp_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

class VerifyOtpPage extends StatelessWidget {
  VerifyOtpPage({super.key});

  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
      listener: (context, state) {
        if (state is VerifyOtpResult) {
          VerifyOtpCubit cubit = BlocProvider.of(context);
          Get.snackbar("", state.message);
          if (state.success) {
            Navigator.pushNamed(
              context,
              AppRoutes.forgetPassword,
              arguments: ForgetPasswordEntity(
                email: cubit.email,
                otp: cubit.otp,
              ),
            );
          }
        }
      },
      builder: (context, state) {
        VerifyOtpCubit cubit = BlocProvider.of(context);
        return Scaffold(
          backgroundColor: RahtkColors.tealColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Form(
                    key: _formState,
                    child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      animationType: AnimationType.fade,
                      onChanged: (value) {
                        cubit.otp = value;
                      },
                      validator: (otp) {
                        if ((otp?.length ?? 0) < 4) {
                          return 'invalid_otp'.tr;
                        }
                        return null;
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(4),
                        borderWidth: 1.0,
                        fieldHeight: 55.0,
                        fieldWidth: 55.0,
                        selectedColor: Colors.white,
                        selectedFillColor: Colors.transparent,
                        inactiveFillColor: Colors.white,
                        activeFillColor: Colors.white,
                        inactiveColor: Colors.white,
                        activeColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  RahtkLoadingButton(
                    loadingState: cubit.loadingState,
                    loaderColor: Colors.white,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      onPressed: () {
                        if (_formState.currentState!.validate()) {
                          cubit.submitOtp();
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "verify_otp".tr,
                            style: const TextStyle(
                              color: RahtkColors.tealColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
