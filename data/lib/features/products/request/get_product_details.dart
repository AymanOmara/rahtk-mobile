import 'package:data/network/remote_target.dart';

class GetProductDetails extends IRemoteTarget {
  GetProductDetails({
    required int productId,
  }) : super(
          path: "api/Product/product-details",
          method: HttpMethod.get,
          queryParameters: {
            'ProductId': productId,
          },
        );
}
