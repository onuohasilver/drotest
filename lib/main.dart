import 'package:drohealthtest/cubit/cart_cubit.dart';
import 'package:drohealthtest/screens/cart/cartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => CartCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dro Health',
        theme: ThemeData(
          fontFamily: 'Proxima',
          primarySwatch: Colors.blue,
        ),
        home: Material(child: CartScreen()),
      ),
    );
  }
}
