import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/add_payment_entity.dart';
import 'package:domain/features/order/entity/address_entity.dart';
import 'package:domain/features/order/entity/create_address_entity.dart';
import 'package:domain/features/order/entity/create_order_entity.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:domain/features/order/entity/payment_option_entity.dart';

abstract interface class IOrderRepository {
  Future<Result<Response<AddressEntity?>, NetworkException>> createAddress(
    CreateAddressEntity createAddress,
  );

  Future<Result<List<AddressEntity>, NetworkException>> getAddress();

  Future<Result<List<PaymentOptionEntity>, NetworkException>> getPayments();

  Future<Result<Response<PaymentOptionEntity?>, NetworkException>>
      createPayment(
    BasePaymentEntity entity,
  );

  Future<Result<Response<OrderEntity?>, NetworkException>> createOrder(
    CreateOrderEntity entity,
  );

  Future<Result<List<OrderEntity>, NetworkException>> getOrders();
}
