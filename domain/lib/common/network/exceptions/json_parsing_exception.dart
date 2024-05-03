import 'network_exception.dart';

class JsonParsingException implements NetworkException{
  @override
  String  message = "Error While parsing json";
  JsonParsingException(this.message);
}