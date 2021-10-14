import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Calculates the total amount of items in the cart
getTotalCartAmount(BuildContext context) {
  return BlocProvider.of<CartCubit>(context)
      .state
      .cartItems
      .fold(0, (int t, e) => t + e.price);
}
