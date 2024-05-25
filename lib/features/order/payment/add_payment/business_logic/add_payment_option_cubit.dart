import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/add_payment_entity.dart';
import 'package:domain/features/order/entity/payment_option_entity.dart';
import 'package:domain/features/order/use_case/add_payment_use_case.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/i_add_able.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';
import 'package:rahtk_mobile/features/order/payment/add_payment/display/add_paymentDisplay.dart';

part 'add_payment_option_state.dart';

class AddPaymentOptionCubit extends Cubit<AddPaymentOptionState> {
  AddPaymentOptionCubit(
    this._addPaymentUseCase,
    this.addAble,
  ) : super(AddPaymentOptionInitial());
  final AddPaymentUseCase _addPaymentUseCase;
  final IAddAble<PaymentOptionEntity> addAble;
  LoadingState loadingState = Idle();
  var paymentEntity = AddPaymentDisplay().obs;

  void submit(){
    loadingState = Loading();
    emit(AddPaymentOptionLoading());
    _addPaymentUseCase(paymentEntity.value.toEntity()).then((value) {
      switch (value) {
        case Success(data: final data):
          if(data.data != null){
            paymentEntity = AddPaymentDisplay().obs;
            addAble.onAdd(data.data!);
          }
          loadingState = LoadingSuccess(data: data);
          emit(AddPaymentOptionResult(success: data.statusCode == 200,message: data.message));
          break;
        case Failure(exception: final exception):
          loadingState = LoadingException(exception);
          emit(AddPaymentOptionResult(message: exception.message,success: false));
          break;
      }
    });
  }

}
