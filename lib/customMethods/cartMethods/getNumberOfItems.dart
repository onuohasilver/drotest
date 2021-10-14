import 'package:drohealthtest/cubit/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Retrieves the number of items that match the parsed name contained in the Cart
int getNumberInCart(BuildContext context, String name) {
  return BlocProvider.of<CartCubit>(context)
      .state
      .cartItems
      .where((element) => element.name == name)
      .length;
}
