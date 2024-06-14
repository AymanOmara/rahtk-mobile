import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/auth/use_case/login_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginInitial());
  final LoginUseCase _loginUseCase;
  LoadingState loadingState = Idle();
  String email = "";
  String password = "";
  bool isPasswordVisible = false;
  void login() {
    loadingState = Loading();
    emit(LoginLoading());
    _loginUseCase(email, password).then((value) {
      loadingState = Idle();
      switch (value) {
        case Success(data: final data):
          emit(LoginResult(success: data.success,message: data.message));
          break;
        case Failure(exception: final exception):
          emit(LoginResult(success:false,message: exception.message));
          break;
      }
    });
  }
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(LoginTogglePasswordVisibility());
  }
}
