import 'package:common/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/core/helper/utils.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_btn.dart';
import 'package:rahtk_mobile/core/ui/rahtk_back_btn.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/auth/registration/business_logic/registration_cubit.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationResult) {
          if (state.success) {
            Navigator.of(context).pop();
            _formState.currentState?.reset();
          }
          Get.snackbar("", state.message);
        }
      },
      builder: (context, state) {
        RegistrationCubit cubit = BlocProvider.of(context);
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            backgroundColor: RahtkColors.tealColor,
            body: SafeArea(
              child: Form(
                key: _formState,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        RahtkBackBtn(),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
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
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "sign_up_to_your_account".tr,
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "first_name".tr,
                                ),
                                onChanged: (firstName) {
                                  cubit.registrationEntity.firstName =
                                      firstName;
                                },
                                validator: (txt) =>
                                    Validator.validateRequired(txt),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "last_name".tr,
                                ),
                                onChanged: (lastName) {
                                  cubit.registrationEntity.lastName = lastName;
                                },
                                validator: (txt) =>
                                    Validator.validateRequired(txt),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "email".tr,
                                ),
                                onChanged: (email) {
                                  cubit.registrationEntity.email = email;
                                },
                                validator: (email) =>
                                    Validator.validateEmail(email),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: "phone_number".tr,
                                ),
                                onChanged: (phone) {
                                  cubit.registrationEntity.phoneNumber = phone;
                                },
                                validator: (phone) =>
                                    Validator.validatePhone(phone),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
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
                                onChanged: (password) {
                                  cubit.registrationEntity.password = password;
                                },

                                validator: (password) =>
                                    Validator.validatePassword(password),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                obscureText: !cubit.isConfirmPasswordVisible,
                                decoration: InputDecoration(
                                  labelText: "re_enter_password".tr,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      cubit.isConfirmPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      cubit.toggleConfirmPasswordVisibility();
                                    },
                                  ),
                                ),
                                onChanged: (passwordConfirmation) {
                                  cubit.registrationEntity
                                          .passwordConfirmation =
                                      passwordConfirmation;
                                },
                                validator: (passwordConfirmation) =>
                                    Validator.validateConfirmPassword(
                                  passwordConfirmation,
                                  cubit.registrationEntity.password,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              RahtkLoadingButton(
                                loaderColor: Colors.white,
                                loadingState: cubit.loadingState,
                                child: MaterialButton(
                                  color: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      50,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formState.currentState!.validate()) {
                                      cubit.register();
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "create".tr,
                                        style: const TextStyle(
                                          color: RahtkColors.tealColor,
                                          fontSize: 16,
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
