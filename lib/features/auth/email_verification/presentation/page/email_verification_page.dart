import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/helper/utils.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_btn.dart';
import 'package:rahtk_mobile/core/ui/rahtk_back_btn.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/auth/email_verification/business_logic/email_verification_cubit.dart';
import 'package:get/get.dart';

class EmailVerificationPage extends StatelessWidget {
  EmailVerificationPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailVerificationCubit, EmailVerificationState>(
      listener: (context, state) {
        if (state is EmailVerificationResult) {
          Get.snackbar("", state.message.tr);
          if (state.success) {
            EmailVerificationCubit cubit = BlocProvider.of(context);
            Navigator.pushNamed(
              context,
              AppRoutes.verifyOtp,
              arguments: cubit.email,
            );
          }
        }
      },
      builder: (context, state) {
        EmailVerificationCubit cubit = BlocProvider.of(context);
        return Scaffold(
          backgroundColor: RahtkColors.tealColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Row(
                    children: [
                      RahtkBackBtn(),
                    ],
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  Text(
                    "verify_your_email".tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "otp_sent_to_your_email".tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              onChanged: (email) {
                                cubit.email = email;
                              },
                              validator: (email) => Validator.validateEmail(email),
                              decoration: InputDecoration(
                                labelText: "email".tr,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RahtkLoadingButton(
                            loaderColor: Colors.white,
                            loadingState: cubit.loadingState,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.verifyEmail();
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "verify".tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: RahtkColors.tealColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: true,
                                  ),
                                ],
                              ),
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
