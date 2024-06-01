part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesResult extends FavoritesState {}

final class FavoritesUpdateFavoriteList extends FavoritesState {
  final List<ProductDisplay> favorites;

  FavoritesUpdateFavoriteList({
    required this.favorites,
  });
}
