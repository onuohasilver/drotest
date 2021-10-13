import 'package:drohealthtest/components/cartScreen/cartItem.dart';
import 'package:drohealthtest/components/cartScreen/cartTopBar.dart';
import 'package:drohealthtest/components/topBar.dart';
import 'package:drohealthtest/logic/cartBloc/cart_cubit.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return BlocBuilder<CartCubit, List>(
      builder: (context, state) {
        return Material(
          child: Container(
            color: Colors.white,
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height * .15,
                  child: TopBar(child: CartTopBar()),
                ),
                Column(
                  children: [
                    SizedBox(height: size.height * .18),
                    Expanded(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: 3,
                        separatorBuilder: (context, index) => Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return CartItem();
                        },
                      ),
                    ),
                    BlocBuilder<CartCubit, List>(builder: (context, snapshot) {
                      return Text('$snapshot');
                    })
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
