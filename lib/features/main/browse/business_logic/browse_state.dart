part of 'browse_cubit.dart';

@immutable
abstract class BrowseState {}

final class BrowseInitial extends BrowseState {}

final class BrowseLoading extends BrowseState {}

final class BrowseResult extends BrowseState {}
