part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}

final class ProfileResult extends ProfileState {}
