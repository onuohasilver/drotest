import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

int getNumberInCart(BuildContext context, String name) {
  return BlocProvider.of<CartCubit>(context)
      .state
      .cartItems
      .where((element) => element.name == name)
      .length;
}
