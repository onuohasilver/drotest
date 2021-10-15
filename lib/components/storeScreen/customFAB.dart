import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';
import 'package:drohealthtest/screens/cartScreen.dart';
import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFab extends StatelessWidget {
  final bool switchFAB;
  const CustomFab(
    this.switchFAB, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      constraints: BoxConstraints.tight(Size(
        switchFAB ? size.width * .13 : size.width * .32,
        size.height * .06,
      )),
      decoration: BoxDecoration(
          gradient: DroColors.redGradient,
          boxShadow: [
            BoxShadow(color: Colors.red, spreadRadius: 1, blurRadius: 5)
          ],
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(1000)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(),
            ),
          ),
          child: switchFAB
              ? Container(
                  child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ))
              : Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Checkout',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                        BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            return Material(
                              color: Colors.yellow,
                              type: MaterialType.circle,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  context
                                      .read<CartCubit>()
                                      .items
                                      .length
                                      .toString(),
                                  style: TextStyle(
                                      // color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
