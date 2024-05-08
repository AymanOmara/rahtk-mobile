import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/helper/utils.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_btn.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/auth/forget_password/business_logic/forget_password_cubit.dart';
import 'package:get/get.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordResult) {
          Get.snackbar("", state.message);
          if (state.success) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.login,
              (route) => false,
            );
          }
        }
      },
      builder: (context, state) {
        ForgetPasswordCubit cubit = BlocProvider.of(context);
        return Scaffold(
          backgroundColor: RahtkColors.tealColor,
          body: SafeArea(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 120,
                        ),
                        TextFormField(
                          obscureText: true,
                          onChanged: (password) {
                            cubit.forgetPasswordEntity.password = password;
                          },
                          validator: (password) =>
                              Validator.validatePassword(password),
                          decoration: InputDecoration(
                            labelText: "password".tr,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          onChanged: (confirmPassword) {
                            cubit.forgetPasswordEntity.confirmPassword =
                                confirmPassword;
                          },
                          validator: (password) =>
                              Validator.validateConfirmPassword(
                            password,
                            cubit.forgetPasswordEntity.password,
                          ),
                          decoration: InputDecoration(
                            labelText: "confirm_password".tr,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RahtkLoadingButton(
                          loadingState: cubit.loadingState,
                          loaderColor: Colors.white,
                          child: MaterialButton(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                50,
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.submit();
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "confirm".tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: RahtkColors.tealColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
