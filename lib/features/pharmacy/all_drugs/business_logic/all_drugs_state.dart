part of 'all_drugs_cubit.dart';

@immutable
abstract class AllDrugsState {}

final class AllDrugsInitial extends AllDrugsState {}

final class AllDrugsLoading extends AllDrugsState {}

final class AllDrugsResult extends AllDrugsState {}
