part of 'notifications_cubit.dart';

@immutable
abstract class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsLoading extends NotificationsState {}

final class NotificationsResult extends NotificationsState {}
