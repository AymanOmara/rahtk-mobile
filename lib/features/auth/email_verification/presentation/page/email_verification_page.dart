import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/helper/utils.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_btn.dart';
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
                  const SizedBox(
                    height: 130,
                  ),
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
                    loadingState: cubit.loadingState,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: Get.width * 0.5 - 40,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          cubit.verifyEmail();
                        }
                      },
                      child: Text("login".tr),
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
