import 'package:drohealthtest/logic/cartBloc/cart_bloc.dart';
import 'package:drohealthtest/screens/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = CartObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dro Health',
      theme: ThemeData(
        fontFamily: 'Proxima',
        primarySwatch: Colors.blue,
      ),
      home: Material(child: StoreScreen()),
    );
  }
}
