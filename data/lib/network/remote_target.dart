abstract class IRemoteTarget {
  String? path;
  dynamic body;
  Map<String, dynamic> headers = {};
  HttpMethod method = HttpMethod.get;
  Map<String, dynamic>? queryParameter;

  IRemoteTarget({this.path});
}

enum HttpMethod {
  get("GET"),
  put("PUT"),
  delete("DELETE"),
  post("POST");

  final String value;

  const HttpMethod(this.value);
}
