import 'network_exception.dart';

class GeneralException implements NetworkException {

  @override
  String get message => "error_try_again_later";
}