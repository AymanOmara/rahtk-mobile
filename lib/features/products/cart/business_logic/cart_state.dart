part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

final class CartInitial extends CartState {}

final class CartAdd extends CartState {}
