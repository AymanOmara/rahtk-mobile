import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/auth/entities/registration_entity.dart';
import 'package:domain/features/auth/use_case/registration_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(
    this._registrationUseCase,
  ) : super(RegistrationInitial());

  final RegistrationUseCase _registrationUseCase;
  RegistrationEntity registrationEntity = RegistrationEntity();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  LoadingState loadingState = Idle();

  void register() {
    loadingState = Loading();
    emit(RegistrationLoading());
    _registrationUseCase(registrationEntity).then((value) {
      loadingState = Idle();
      switch (value) {
        case Success(data: final data):
          if (data.success) {
            registrationEntity = RegistrationEntity();
          }
          emit(
            RegistrationResult(
              success: data.success,
              message: data.message,
            ),
          );
          break;
        case Failure(exception: final exception):
          emit(
            RegistrationResult(
              success: false,
              message: exception.message,
            ),
          );
      }
    });
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(RegistrationPasswordVisibilityChanged());
  }
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(RegistrationPasswordVisibilityChanged());
  }
}
