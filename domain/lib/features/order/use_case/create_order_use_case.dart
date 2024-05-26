import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/create_order_entity.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:domain/features/order/repository/i_order_repository.dart';

class CreateOrderUseCase{
  final IOrderRepository _orderRepository;
  const CreateOrderUseCase(this._orderRepository);
  Future<Result<Response<OrderEntity?>, NetworkException>> call(CreateOrderEntity entity) async{
    return await _orderRepository.createOrder(entity);
  }
}