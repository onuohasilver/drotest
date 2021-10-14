import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final List<int> _cartItems = [];
  CartCubit() : super(CartInitial([]));
  List<int> get items => _cartItems;

  addToCart(int item) {
    _cartItems.add(Random().nextInt(10));
    emit(ProductAdded.copyWith(cartItems: _cartItems));
  }
}
