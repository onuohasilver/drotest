import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';
import 'package:drohealthtest/screens/cartScreen.dart';
import 'package:drohealthtest/screens/store.dart';
import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../purpleButton.dart';

Future showAddToCartModal(BuildContext context) {
  SizeReference size = SizeReference(context);
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Container(
              height: size.height * .35,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                    child: Text(
                      '${state.cartItems.last.name} has been succesfully added to cart!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: size.width * .047),
                    ),
                  ),
                  SizedBox(height: size.height * .02),
                  PurpleButton(
                    child: Center(
                      child: Text(
                        'VIEW CART',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: size.height * .01),
                  SizedBox(
                    width: size.width * .8,
                    height: size.height * .055,
                    child: OutlinedButton(
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(
                              BorderSide(color: DroColors.purple)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StoreScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'CONTINUE SHOPPING',
                        style: TextStyle(
                          color: DroColors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      });
}
