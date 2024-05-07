import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/auth/use_case/verify_otp_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  VerifyOtpCubit(
    this.email,
    this._verifyOtpUseCase,
  ) : super(VerifyOtpInitial());
  final String email;
  String otp = "";
  LoadingState loadingState = Idle();
  final VerifyOtpUseCase _verifyOtpUseCase;

  void submitOtp() {
    loadingState = Loading();
    emit(VerifyOtpLoading());
    _verifyOtpUseCase(otp, email).then((value) {
      loadingState = Idle();
      switch (value) {
        case Success(data: final data):
          emit(VerifyOtpResult(success: data.success, message: data.message));
          break;
        case Failure(exception: final exception):
          emit(VerifyOtpResult(success: false, message: exception.message));
      }
    });
  }
}
