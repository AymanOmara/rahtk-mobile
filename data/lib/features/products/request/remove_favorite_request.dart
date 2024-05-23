import 'package:data/network/remote_target.dart';

class RemoveFavoriteRequest extends IRemoteTarget {
  RemoveFavoriteRequest({
    required int productId,
  }) : super(
          method: HttpMethod.post,
          path: "api/Product/remove-favorite",
          queryParameters: {
            "ProductId": productId,
          },
        );
}