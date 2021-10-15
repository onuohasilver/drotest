import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';
import 'package:drohealthtest/components/cartScreen/cartItem.dart';
import 'package:drohealthtest/components/cartScreen/cartTopBar.dart';
import 'package:drohealthtest/components/generic/topBar.dart';
import 'package:drohealthtest/components/input/purpleButton.dart';
import 'package:drohealthtest/customMethods/cartMethods/getCartList.dart';
import 'package:drohealthtest/customMethods/cartMethods/getTotalCartAmount.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return BlocBuilder<CartCubit, CartState>(
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
                state.cartItems.isEmpty
                    ? Center(
                        child: Text(
                        'Cart is Empty',
                        style: TextStyle(fontSize: size.width * .05),
                      ))
                    : Column(
                        children: [
                          SizedBox(height: size.height * .18),
                          Expanded(
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: state.cartItems.toSet().length,
                              separatorBuilder: (context, index) => Divider(),
                              itemBuilder: (BuildContext context, int index) {
                                return CartItem(
                                  drugModel: getMappedCartList(state)[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                state.cartItems.isEmpty
                    ? SizedBox()
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: size.height * .13,
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .07),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(TextSpan(
                                    text: 'Total:  ',
                                    children: [
                                      TextSpan(
                                          text:
                                              '₦${getTotalCartAmount(state).toString()}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.width * .047))
                                    ],
                                    style: TextStyle(
                                        fontSize: size.width * .047))),
                                SizedBox(
                                    width: size.width * .5,
                                    child: PurpleButton(
                                        onTap: () {},
                                        child: Center(
                                          child: Text(
                                            'CHECKOUT',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: size.width * .037,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )))
                              ],
                            ),
                          ),
                        ),
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
