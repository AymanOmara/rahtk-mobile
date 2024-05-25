import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/address_entity.dart';
import 'package:domain/features/order/repository/i_order_repository.dart';

class GetAddressUseCase{
  final IOrderRepository _orderRepository;

  GetAddressUseCase(this._orderRepository);

  Future<Result<List<AddressEntity>, NetworkException>> call() async {
    return await _orderRepository.getAddress();
  }
}