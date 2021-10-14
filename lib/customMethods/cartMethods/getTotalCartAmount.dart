import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';

///Calculates the total amount of items in the cart
getTotalCartAmount(CartState state) {
  return state.cartItems.fold(0, (int t, e) => t + e.price);
}
