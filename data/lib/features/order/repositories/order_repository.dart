import 'package:data/common/response_entity_mapper.dart';
import 'package:data/features/order/mappers/add_payment_entity_mapper.dart';
import 'package:data/features/order/mappers/address_entity_mapper.dart';
import 'package:data/features/order/mappers/create_address_mapper.dart';
import 'package:data/features/order/mappers/create_order_entity_mapper.dart';
import 'package:data/features/order/mappers/order_entity_mapper.dart';
import 'package:data/features/order/mappers/payment_option_entity_mapper.dart';
import 'package:data/features/order/model/Payment_model.dart';
import 'package:data/features/order/model/address_model.dart';
import 'package:data/features/order/model/addresses_model.dart';
import 'package:data/features/order/model/order_model.dart';
import 'package:data/features/order/model/payments_model.dart';
import 'package:data/features/order/request/add_payment_request.dart';
import 'package:data/features/order/request/create_address_request.dart';
import 'package:data/features/order/request/create_order_request.dart';
import 'package:data/features/order/request/get_addresses_request.dart';
import 'package:data/features/order/request/get_orders_request.dart';
import 'package:data/features/order/request/get_payments_request.dart';
import 'package:data/network/i_base_api.dart';
import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/add_payment_entity.dart';
import 'package:domain/features/order/entity/address_entity.dart';
import 'package:domain/features/order/entity/create_address_entity.dart';
import 'package:domain/features/order/entity/create_order_entity.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:domain/features/order/entity/payment_option_entity.dart';
import 'package:domain/features/order/repository/i_order_repository.dart';

class OrderRepository implements IOrderRepository {
  final IAPIService _service;

  const OrderRepository(
    this._service,
  );

  @override
  Future<Result<Response<AddressEntity?>, NetworkException>> createAddress(
    CreateAddressEntity createAddress,
  ) async {
    var result = await _service.fetchData<AddressModel>(
      CreateAddressRequest(
        data: createAddress.toModel(),
      ),
      data: AddressModel(),
    );
    switch (result) {
      case Success(data: final data):
        return Success(data.toEntity(data.data?.toEntity()));
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<List<AddressEntity>, NetworkException>> getAddress() async {
    var result = await _service.fetchData<List<AddressModel>>(
      GetAddressesRequest(),
      data: AddressesModel(),
    );
    switch (result) {
      case Success(data: final data):
        return Success(data.data?.map((e) => e.toEntity()).toList() ?? []);
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<Response<PaymentOptionEntity?>, NetworkException>>
      createPayment(BasePaymentEntity entity) async {
    var result = await _service.fetchData<PaymentModel>(
      AddPaymentRequest(
        data: entity.toModel(),
      ),
      data: PaymentModel(),
    );
    switch (result) {
      case Success(data: final data):
        return Success(data.toEntity(data.data?.toEntity()));
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<List<PaymentOptionEntity>, NetworkException>>
      getPayments() async {
    var result = await _service.fetchData<List<PaymentModel>>(
      GetPaymentsRequest(),
      data: PaymentsModel(),
    );
    switch (result) {
      case Success(data: final data):
        return Success(data.data?.map((e) => e.toEntity()).toList() ?? []);
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<Response<OrderEntity?>, NetworkException>> createOrder(
    CreateOrderEntity entity,
  ) async {
    var result = await _service.fetchData<OrderModel>(
      CreateOrderRequest(
        data: entity.toModel(),
      ),
      data: OrderModel(),
    );
    switch (result) {
      case Success(data: final data):
        return Success(data.toEntity(data.data?.toEntity()));
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<List<OrderEntity>, NetworkException>> getOrders() async{
    var result = await _service.fetchData<List<OrderModel>>(
      GetOrdersRequest(),
      data: OrdersModel(),
    );
    switch (result) {
      case Success(data: final data):
        return Success(data.data?.map((e) => e.toEntity()).toList() ?? []);
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }
}
