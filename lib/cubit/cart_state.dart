part of 'cart_cubit.dart';

class CartInitial extends CartState {
  CartInitial(List<int> cartItems) : super(cartItems);
}

abstract class CartState extends Equatable {
  final List<int> cartItems;
  const CartState(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}

class ProductAdded extends CartState {
  final List<int> cartItems;
  ProductAdded(this.cartItems) : super(cartItems);
  factory ProductAdded.copyWith({List<int>? cartItems}) {
    return ProductAdded(cartItems!);
  }

  @override
  List<Object> get props => [cartItems];
}
