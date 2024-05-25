import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/add_payment_entity.dart';
import 'package:domain/features/order/entity/payment_option_entity.dart';
import 'package:domain/features/order/repository/i_order_repository.dart';

class AddPaymentUseCase {
  final IOrderRepository _orderRepository;

  const AddPaymentUseCase(this._orderRepository);

  Future<Result<Response<PaymentOptionEntity?>, NetworkException>> call(
    BasePaymentEntity addPayment,
  ) async {
    return await _orderRepository.createPayment(addPayment);
  }
}
