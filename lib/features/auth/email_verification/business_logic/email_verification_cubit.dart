import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/auth/use_case/email_verification_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit(
    this._emailVerificationUseCase,
  ) : super(EmailVerificationInitial());
  final EmailVerificationUseCase _emailVerificationUseCase;
  String email = "";
  LoadingState loadingState = Idle();

  void verifyEmail() {
    loadingState = Loading();
    emit(EmailVerificationLoading());
    _emailVerificationUseCase(email).then((value) {
      loadingState = Idle();
      switch (value) {
        case Success(data: final data):
          emit(EmailVerificationResult(message: data.message, success: data.success));
          break;
        case Failure(exception: final exception):
          emit(EmailVerificationResult(message: exception.message, success: false));
          break;
      }
    });
  }
}
