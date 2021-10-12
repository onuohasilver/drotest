import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

class CustomFab extends StatelessWidget {
  final bool switchFAB;
  const CustomFab(
    this.switchFAB, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return switchFAB
        ? Container()
        : Container(
            height: size.height * .06,
            width: size.width * .3,
            decoration: BoxDecoration(
                gradient: DroColors.redGradient,
                borderRadius: BorderRadius.circular(1000)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Checkout',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                )
              ],
            ),
          );
  }
}
