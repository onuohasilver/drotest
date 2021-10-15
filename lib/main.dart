import 'package:drohealthtest/bloc/search_cubit/search_cubit.dart';
import 'package:drohealthtest/screens/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_cubit/cart_cubit.dart';
import 'bloc/drug_quantity_cubit/drugquantity_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => SearchCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dro Health',
        theme: ThemeData(
          fontFamily: 'Proxima',
          primarySwatch: Colors.blue,
        ),
        home: Material(child: StoreScreen()),
      ),
    );
  }
}
