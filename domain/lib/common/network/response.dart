class Response<T> {
  T? data;
  final String message;
  final bool success;
  final int statusCode;

  Response({
    this.data,
    this.message = "",
    this.statusCode = 400,
    this.success = false,
  });
}
