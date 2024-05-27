import 'package:data/network/remote_target.dart';

class GetDrugsRequest extends IRemoteTarget {
  GetDrugsRequest() : super(path: "api/Drug/get-drugs");
}
