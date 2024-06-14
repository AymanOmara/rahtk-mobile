part of 'update_reminder_cubit.dart';

@immutable
abstract class UpdateReminderState {}

final class UpdateReminderInitial extends UpdateReminderState {}

final class UpdateReminderLoading extends UpdateReminderState {}

final class UpdateReminderUpdateSelectedProduct extends UpdateReminderState {}

final class UpdateReminderResult extends UpdateReminderState {
  final String message;
  final bool success;

  UpdateReminderResult({
    required this.message,
    required this.success,
  });
}
