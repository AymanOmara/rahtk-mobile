import 'network/exceptions/network_exception.dart';

sealed class Result<S, E extends Exception> {
  const Result();
}

final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(this.value);

  final S value;
}

final class Failure<S, E extends NetworkException> extends Result<S, E> {
  const Failure(this.exception);

  final E exception;
}