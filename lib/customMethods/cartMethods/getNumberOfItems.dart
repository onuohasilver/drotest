import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';

int getNumberInCart(CartState state, String name) {
  return state.cartItems.where((element) => element.name == name).length;
}
