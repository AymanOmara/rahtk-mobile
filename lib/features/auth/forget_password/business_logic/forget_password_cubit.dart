import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/auth/entities/forget_password_entity.dart';
import 'package:domain/features/auth/use_case/forget_password_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(
    this.forgetPasswordEntity,
    this._forgetPasswordUseCase,
  ) : super(ForgetPasswordInitial());
  final ForgetPasswordEntity forgetPasswordEntity;
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  LoadingState loadingState = Idle();
  void submit(){
    loadingState = Idle();
    emit(ForgetPasswordLoading());
    _forgetPasswordUseCase(forgetPasswordEntity).then((value) {
      loadingState = Idle();
      switch (value) {
        case Success(data: final data):
          emit(ForgetPasswordResult(message: data.message, success: data.success));
          break;
        case Failure(exception: final exception):
          emit(ForgetPasswordResult(message: exception.message, success: false));
      }
    });
  }
}
