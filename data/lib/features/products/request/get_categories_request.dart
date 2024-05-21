import 'package:data/network/remote_target.dart';

class GetCategoriesRequest extends IRemoteTarget{
  GetCategoriesRequest() : super(
    method: HttpMethod.get,
    path: "/api/category/get-all-categories",
  );
}