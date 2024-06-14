part of 'add_reminder_cubit.dart';

@immutable
abstract class AddReminderState {}

final class AddReminderInitial extends AddReminderState {}

final class AddReminderLoading extends AddReminderState {}

final class AddReminderUpdateSelectedProduct extends AddReminderState {}

final class AddReminderResult extends AddReminderState {
  final bool success;
  final String message;

  AddReminderResult({
    required this.success,
    required this.message,
  });
}
