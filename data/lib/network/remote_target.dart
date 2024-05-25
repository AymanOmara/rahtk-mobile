abstract class IRemoteTarget {
  String? path;
  dynamic body;
  Map<String, dynamic> headers = {};
  HttpMethod method;
  Map<String, dynamic>? queryParameters;

  IRemoteTarget({
    this.path,
    this.method = HttpMethod.get,
    this.queryParameters,
    this.body,
  });
}

enum HttpMethod {
  get("GET"),
  put("PUT"),
  delete("DELETE"),
  post("POST");

  final String value;

  const HttpMethod(this.value);
}
