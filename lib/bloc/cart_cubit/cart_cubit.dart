import 'package:bloc/bloc.dart';
import 'package:drohealthtest/models/drugModel.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final List<DrugModel> _cartItems = [];
  CartCubit() : super(CartInitial([]));
  List<DrugModel> get items => _cartItems;

  addToCart(DrugModel item) {
    _cartItems.add(item);
    emit(ProductAdded([...state.cartItems, item]));
  }

  removeFromCart(DrugModel item) {
    _cartItems.remove(item);

    emit(ProductRemoved([...state.cartItems]..remove(item)));
  }
}
