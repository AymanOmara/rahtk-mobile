import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:domain/features/order/repository/i_order_repository.dart';

class GetOrdersUseCase {
  final IOrderRepository _orderRepository;

  const GetOrdersUseCase(this._orderRepository);

  Future<Result<List<OrderEntity>, NetworkException>> call() async {
    return await _orderRepository.getOrders();
  }
}