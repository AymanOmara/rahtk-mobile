import 'package:domain/common/network/exceptions/network_exception.dart';

sealed class LoadingState {}

class Loading extends LoadingState {}

class Idle extends LoadingState {}

class LoadingSuccess<T> extends LoadingState {
  T? data;

  LoadingSuccess({
    this.data,
  });
}

class LoadingException extends LoadingState {
  final Exception exception;

  LoadingException(
    this.exception,
  );
}
