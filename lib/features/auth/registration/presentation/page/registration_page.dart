import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          Get.snackbar("", state.message);
          if (state.success) {}
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: RahtkColors.tealColor,
          body: SafeArea(
            child: Form(
              key: _formState,
              child: Column(
                children: [],
              ),
            ),
          ),
        );
      },
    );
  }
}
