import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/payment_option_entity.dart';
import 'package:domain/features/order/repository/i_order_repository.dart';

class GetPaymentsUseCase{
  final IOrderRepository _orderRepository;

  const GetPaymentsUseCase(this._orderRepository);

  Future<Result<List<PaymentOptionEntity>, NetworkException>> call() async {
    return await _orderRepository.getPayments();
  }
}