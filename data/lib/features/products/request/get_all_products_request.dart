import 'package:data/network/remote_target.dart';

class GetAllProductsRequest extends IRemoteTarget {
  GetAllProductsRequest():super(path: "api/Product/get-all-products");
}
