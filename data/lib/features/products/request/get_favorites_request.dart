import 'package:data/network/remote_target.dart';

class GetFavoritesRequest extends IRemoteTarget {
  GetFavoritesRequest()
      : super(
          method: HttpMethod.get,
          path: "/api/Product/get-favorite",
        );
}
