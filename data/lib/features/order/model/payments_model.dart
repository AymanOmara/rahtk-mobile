import 'package:data/network/decode_able.dart';

import 'Payment_model.dart';

class PaymentsModel implements DecodeAble<List<PaymentModel>, List?> {
  @override
  List<PaymentModel> fromJson(List? json) {
    return json?.map((e) => PaymentModel().fromJson(e)).toList() ?? [];
  }
}
