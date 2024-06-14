import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/helper/utils.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_btn.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/auth/login/business_logic/login_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginResult) {
          if (state.success) {
            Navigator.pushNamed(context, AppRoutes.home);
          } else {
            Get.snackbar("error".tr, state.message.tr);
          }
        }
      },
      builder: (context, state) {
        LoginCubit cubit = BlocProvider.of(context);
        return Scaffold(
          backgroundColor: RahtkColors.tealColor,
          body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 120.h,
                  ),
                  Text(
                    "welcome_to_rahtk".tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    "login_to_your_account".tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formState,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "email".tr,
                                ),
                                onChanged: (email) {
                                  cubit.email = email;
                                },
                                validator: (email) =>
                                    Validator.validateEmail(email),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                onChanged: (password) {
                                  cubit.password = password;
                                },
                                obscureText: !cubit.isPasswordVisible,
                                decoration: InputDecoration(
                                  labelText: "password".tr,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      cubit.isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      cubit.togglePasswordVisibility();
                                    },
                                  ),
                                ),
                                validator: (password) =>
                                    Validator.validatePassword(password),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              RahtkLoadingButton(
                                loadingState: cubit.loadingState,
                                loaderColor: Colors.white,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: Get.width * 0.5 - 40,
                                  ),
                                  onPressed: () async {
                                    if (_formState.currentState!.validate()) {
                                      cubit.login();
                                    }
                                  },
                                  child: Text(
                                    "login".tr,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.emailVerification,
                                  );
                                },
                                child: Text(
                                  "forget_your_password".tr,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "don't_have_an_account".tr,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.registration,
                                      );
                                    },
                                    child: Text(
                                      "sign_up".tr,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
