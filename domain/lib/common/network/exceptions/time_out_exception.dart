import 'network_exception.dart';

class TimeOut implements NetworkException{
  @override
  String  message = "time out exception";
}