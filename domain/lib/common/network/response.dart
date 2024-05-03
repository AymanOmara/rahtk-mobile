class Response<T> {
  T? data;
  String message;
  bool success;

  Response({
    required this.data,
    required this.message,
    required this.success,
  });
}
