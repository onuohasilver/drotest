import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';
import 'package:drohealthtest/models/drugModel.dart';

/// Returns a map of all the items added to the cart with their corresponding quantities
List getMappedCartList(CartState state) {
  List<DrugModel> cartSet = state.cartItems.toSet().toList();
  cartSet.sort((a, b) => a.name.compareTo(b.name));
  return cartSet;
}
