import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rahtk_mobile/core/helper/utils.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_btn.dart';
import 'package:rahtk_mobile/core/ui/rahtk_navigation_bar.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/address/add_new_address/business_logic/add_address_cubit.dart';

class AddAddressPage extends StatelessWidget {
  AddAddressPage({super.key});

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddAddressCubit, AddAddressState>(
      listener: (context, state) {
        if (state is AddAddressResult) {
          if (state.success) {
            Get.back();
            Get.snackbar(
              "success".tr,
              state.message,
            );
          }else{
            Get.snackbar(
              "error".tr,
              state.message,
            );
          }
        }
      },
      builder: (context, state) {
        AddAddressCubit cubit = BlocProvider.of(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              RahtkNavigationBar(
                title: "add_new_address".tr,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      fillOverscroll: false,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                bool? serviceEnabled;
                                LocationPermission? permission;

                                serviceEnabled =
                                    await Geolocator.isLocationServiceEnabled();
                                if (!serviceEnabled) {
                                  Get.snackbar(
                                    "error".tr,
                                    "location_disabled".tr,
                                  );
                                  return;
                                }
                                permission = await Geolocator.checkPermission();
                                if (permission == LocationPermission.denied) {
                                  permission =
                                      await Geolocator.requestPermission();
                                }
                                if (permission != LocationPermission.always &&
                                    permission !=
                                        LocationPermission.whileInUse) {
                                  Get.snackbar(
                                    "error".tr,
                                    "location_disabled".tr,
                                  );
                                  return;
                                }
                                Position position =
                                    await Geolocator.getCurrentPosition(
                                        desiredAccuracy: LocationAccuracy.high);
                                List<Placemark> placeMarks =
                                    await placemarkFromCoordinates(
                                        position.latitude, position.longitude);
                                if (placeMarks.isNotEmpty) {
                                  Placemark place = placeMarks[0];
                                  _streetController.text = place.street ?? "";
                                  _cityController.text =
                                      place.subAdministrativeArea ?? "";
                                  _stateController.text =
                                      place.administrativeArea ?? "";
                                  _zipController.text = place.postalCode ?? "";
                                  cubit.entity.street = place.street ?? "";
                                  cubit.entity.city =
                                      place.subAdministrativeArea ?? "";
                                  cubit.entity.state =
                                      place.administrativeArea ?? "";
                                  cubit.entity.zipCode = place.postalCode ?? "";
                                } else {
                                  Get.snackbar(
                                    "error".tr,
                                    "location_un_recognized".tr,
                                  );
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "use_current_location".tr,
                                  )
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: _nameController,
                              cursorColor: RahtkColors.darkGray,
                              decoration: inputDecoration("name".tr),
                              validator: (txt) =>
                                  Validator.validateRequired(txt),
                              onChanged: (value) {
                                cubit.entity.name = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _phoneController,
                              cursorColor: RahtkColors.darkGray,
                              decoration: inputDecoration("phone".tr),
                              validator: (txt) =>
                                  Validator.validateRequired(txt),
                              onChanged: (value) {
                                cubit.entity.phoneNumber = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _streetController,
                              cursorColor: RahtkColors.darkGray,
                              decoration: inputDecoration("street_address".tr),
                              validator: (txt) =>
                                  Validator.validateRequired(txt),
                              onChanged: (value) {
                                cubit.entity.street = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _cityController,
                              cursorColor: RahtkColors.darkGray,
                              decoration: inputDecoration("city".tr),
                              validator: (txt) =>
                                  Validator.validateRequired(txt),
                              onChanged: (value) {
                                cubit.entity.city = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _stateController,
                              cursorColor: RahtkColors.darkGray,
                              decoration: inputDecoration("state".tr),
                              validator: (txt) =>
                                  Validator.validateRequired(txt),
                              onChanged: (value) {
                                cubit.entity.state = value;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _zipController,
                              cursorColor: RahtkColors.darkGray,
                              decoration: inputDecoration("zip_code".tr),
                              validator: (txt) =>
                                  Validator.validateRequired(txt),
                              onChanged: (value) {
                                cubit.entity.zipCode = value;
                              },
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
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: RahtkColors.tealColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        cubit.createAddress();
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "save".tr,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
