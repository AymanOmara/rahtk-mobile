part of 'order_history_cubit.dart';

@immutable
abstract class OrderHistoryState {}

final class OrderHistoryInitial extends OrderHistoryState {}

final class OrderHistoryLoading extends OrderHistoryState {}

final class OrderHistoryResult extends OrderHistoryState {}
