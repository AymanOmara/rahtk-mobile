abstract interface class INetworkException implements Exception {
  final String message;

  const  INetworkException(
      this.message,
      );
}
