part of 'cart_cubit.dart';

class CartInitial extends CartState {
  CartInitial(List<DrugModel> cartItems) : super(cartItems);
}

abstract class CartState extends Equatable {
  final List<DrugModel> cartItems;
  const CartState(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}

class ProductAdded extends CartState {
  final List<DrugModel> cartItems;
  ProductAdded(this.cartItems) : super(cartItems);

  @override
  List<Object> get props => [cartItems];
}

class ProductRemoved extends CartState {
  final List<DrugModel> cartItems;
  ProductRemoved(this.cartItems) : super(cartItems);

  @override
  List<Object> get props => [cartItems];
}
