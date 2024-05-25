import 'package:data/features/order/model/address_model.dart';
import 'package:data/network/decode_able.dart';

class AddressesModel implements DecodeAble<List<AddressModel>, List?> {
  @override
  List<AddressModel> fromJson(List? json) {
    return json
            ?.map<AddressModel>((e) => AddressModel().fromJson(e))
            .toList() ??
        [];
  }
}
