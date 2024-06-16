import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/address_entity.dart';
import 'package:domain/features/order/entity/create_order_entity.dart';
import 'package:domain/features/order/entity/payment_methods.dart';
import 'package:domain/features/order/entity/payment_option_entity.dart';
import 'package:domain/features/order/use_case/create_order_use_case.dart';
import 'package:domain/features/order/use_case/get_payments_use_case.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/i_add_able.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';
import 'package:rahtk_mobile/features/order/payment/choose_payment_option/display/choose_payment_option_params.dart';
import 'package:rahtk_mobile/features/order/payment/choose_payment_option/display/payment_option_display.dart';

part 'choose_payment_option_state.dart';

class ChoosePaymentOptionCubit extends Cubit<ChoosePaymentOptionState>
    implements IAddAble<PaymentOptionEntity> {
  ChoosePaymentOptionCubit(
    this.params,
    this._getPaymentsUseCase,
    this._createOrderUseCase,
  ) : super(ChoosePaymentOptionInitial()) {
    fetchPaymentOptions();
  }

  final CreateOrderUseCase _createOrderUseCase;
  int pageIndex = 0;
  final ChoosePaymentOptionParams params;
  PaymentMethods paymentMethod = PaymentMethods.debitCreditCard;
  LoadingState loadingState = Loading();
  List<PaymentOptionDisplay> paymentOptions = [];
  final GetPaymentsUseCase _getPaymentsUseCase;

  void fetchPaymentOptions() {
    loadingState = Loading();
    emit(ChoosePaymentOptionLoading());
    _getPaymentsUseCase().then((value) {
      switch (value) {
        case Success(data: final data):
          paymentOptions = data.map((e) => e.toDisplay()).toList();
          loadingState = LoadingSuccess(data: "data");
          emit(ChoosePaymentOptionResult());
          break;
        case Failure(exception: final exception):
          loadingState = LoadingException(exception);
          emit(ChoosePaymentOptionResult());
          break;
      }
    });
  }

  @override
  void onAdd(PaymentOptionEntity item) {
    paymentOptions.add(item.toDisplay());
    emit(ChoosePaymentOptionAddPayment());
  }

  void updatePageIndex(int index) {
    pageIndex = index;
    emit(ChoosePaymentOptionUpdatePageIndex());
  }

  void updateSelectedCard(PaymentOptionDisplay display) {
    for (var element in paymentOptions) {
      element.selected = false;
    }
    display.selected = true;
    emit(ChoosePaymentOptionUpdateSelectedCard());
  }

  void updatePaymentMethod(PaymentMethods method) {
    paymentMethod = method;
    emit(ChoosePaymentOptionUpdatePaymentMethod());
  }

  void updateAddress(AddressEntity address) {
    params.address = address;
    emit(ChoosePaymentOptionUpdateAddress());
  }

  void checkout() {
    loadingState = Loading(showSuccessWidget: true);
    emit(ChoosePaymentOptionLoading());
    _createOrderUseCase(_createOrderEntity()).then((value) {
      switch (value) {
        case Success(data: final data):
          loadingState = LoadingSuccess(data: "data");
          emit(ChoosePaymentOptionCreateOrderResult(
              success: data.success,
              message: data.message,
              orderId: data.data?.id));
          break;
        case Failure(exception: final exception):
          loadingState = LoadingSuccess(data: "data");
          emit(ChoosePaymentOptionCreateOrderResult(
              success: false, message: exception.message));
          break;
      }
    });
  }

  CreateOrderEntity _createOrderEntity() {
    return CreateOrderEntity(
      paymentId: paymentOptions.firstWhereOrNull((e) => e.selected)?.id,
      addressId: params.address.id,
      paymentMethod: paymentMethod.name,
      items: params.products
          .map(
            (e) => CreateOrderItemEntity(
              productId: e.product.id,
              quantity: e.productCount,
            ),
          )
          .toList(),
    );
  }
}
