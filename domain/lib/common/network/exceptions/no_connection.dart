import 'network_exception.dart';

class NoConnection implements NetworkException{
  @override
  String  message = "no network connection";
}