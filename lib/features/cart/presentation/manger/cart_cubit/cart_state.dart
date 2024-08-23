part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartLoading extends CartState {}
final class CartSuccess extends CartState {
  final List<Cart> cartItems;
  CartSuccess({required this.cartItems});
}
final class CartFailure extends CartState {
  final String errMessage;
  CartFailure({required this.errMessage});
}
