import 'package:drohealthtest/cubit/cart_cubit.dart';
import 'package:drohealthtest/screens/cart/cartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: CartScreen(),
    );
  }
}
