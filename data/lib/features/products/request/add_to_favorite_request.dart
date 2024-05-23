import 'package:data/network/remote_target.dart';

class AddToFavoriteRequest extends IRemoteTarget {
  AddToFavoriteRequest({required int productId})
      : super(
          method: HttpMethod.post,
          path: "api/Product/add-to-favorite",
          queryParameters: {
            "ProductId": productId,
          },
        );
}
