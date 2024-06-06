import 'package:domain/features/order/entity/address_entity.dart';
import 'package:rahtk_mobile/features/order/cart/display/cart_drug_display.dart';
import 'package:rahtk_mobile/features/order/cart/display/cart_product.dart';

class ChoosePaymentOptionParams {
  final List<CartProductDisplay> products;
  final List<CartDrugDisplay> drugs;
   AddressEntity address;

  ChoosePaymentOptionParams({
    required this.products,
    required this.address,
    required this.drugs,
  });
}