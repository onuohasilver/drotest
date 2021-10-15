import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';

///Retrieves the number of times an item appears in cart using the parsed item name
int getNumberInCart(CartState state, String name) {
  return state.cartItems.where((element) => element.name == name).length;
}
