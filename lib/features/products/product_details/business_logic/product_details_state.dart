part of 'product_details_cubit.dart';

@immutable
abstract class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsReminderResult extends ProductDetailsState {
  final String message;
  final bool success;

  ProductDetailsReminderResult({
    required this.message,
    required this.success,
  });}

final class ProductDetailsResult extends ProductDetailsState {
  final String message;
  final bool success;
  final ProductDisplay? productDisplay;

  ProductDetailsResult({
    required this.message,
    required this.success,
    this.productDisplay,
  });
}
