part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

final class CartInitial extends CartState {}

final class CartAdd extends CartState {}

final class CartLoading extends CartState {}

final class CartRemove extends CartState {}

final class CartIncrement extends CartState {}

final class CartDecrement extends CartState {}

final class CartAddressAdded extends CartState {}

final class CartProductCleared extends CartState {}