import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/address_entity.dart';
import 'package:domain/features/order/entity/create_address_entity.dart';
import 'package:domain/features/order/repository/i_order_repository.dart';

class CreateAddressUseCase {
  final IOrderRepository _repository;

  const CreateAddressUseCase(this._repository);

  Future<Result<Response<AddressEntity?>, NetworkException>> call(
    CreateAddressEntity createAddress,
  ) async {
    return await _repository.createAddress(createAddress);
  }
}
