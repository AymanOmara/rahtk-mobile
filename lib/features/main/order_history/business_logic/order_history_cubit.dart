import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:domain/features/order/use_case/get_orders_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';

part 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit(
    this._getOrdersUseCase,
  ) : super(OrderHistoryInitial()) {
    fetchOrders();
  }

  final GetOrdersUseCase _getOrdersUseCase;
  LoadingState loadingState = Loading();
  List<OrderEntity> orders = [];

  void fetchOrders() {
    loadingState = Loading();
    emit(OrderHistoryLoading());
    _getOrdersUseCase().then((value) {
      switch (value) {
        case Success(data: final data):
          orders = data;
          loadingState = LoadingSuccess(data: data);
          emit(OrderHistoryResult());
          break;
        case Failure(exception: final exception):
          loadingState = LoadingException(exception);
          emit(OrderHistoryResult());
          break;
      }
    });
  }
}
