import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';
import 'package:drohealthtest/models/drugModel.dart';

Map getMappedCartList(CartState state) {
  Map<DrugModel, int> cartMap = {};
  state.cartItems.forEach((element) {
    if (cartMap.containsKey(element))
      cartMap[element] = cartMap[element]! + 1;
    else
      cartMap[element] = 1;
  });
  return cartMap;
}
