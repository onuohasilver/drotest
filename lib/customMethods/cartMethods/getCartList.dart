import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';
import 'package:drohealthtest/models/drugModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Map getMappedCartList(BuildContext context) {
  Map<DrugModel, int> cartMap = {};
  BlocProvider.of<CartCubit>(context).state.cartItems.forEach((element) {
    if (cartMap.containsKey(element))
      cartMap[element] = cartMap[element]! + 1;
    else
      cartMap[element] = 1;
  });
  return cartMap;
}
