import 'package:drohealthtest/screens/cart/cartPage.dart';
import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

import '../purpleButton.dart';

Future showAddToCartModal(BuildContext context) {
  SizeReference size = SizeReference(context);
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: size.height * .35,
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                child: Text(
                  'Emzor paracetamol has been succesfully added to cart!',
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
                      builder: (context) => CartPage(),
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
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {},
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
      });
}
