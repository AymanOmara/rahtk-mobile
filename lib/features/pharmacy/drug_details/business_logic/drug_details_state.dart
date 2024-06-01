part of 'drug_details_cubit.dart';

@immutable
abstract class DrugDetailsState {}

final class DrugDetailsInitial extends DrugDetailsState {}

final class DrugDetailsLoading extends DrugDetailsState {}

final class DrugDetailsResult extends DrugDetailsState {
  final String message;
  final bool success;

  DrugDetailsResult({
    required this.message,
    required this.success,
  });
}
