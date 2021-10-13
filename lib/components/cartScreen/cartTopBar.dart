import 'package:drohealthtest/components/mediumIcon.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartTopBar extends StatelessWidget {
  const CartTopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Column(
      children: [
        SizedBox(height: size.height * .06),
        Row(
          children: [
            TextButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                label: Row(
                  children: [
                    SizedBox(
                      height: size.height * .028,
                      width: size.width * .1,
                      child: SvgPicture.asset('assets/cart.svg',
                          color: Colors.white),
                    ),
                    Text('Cart',
                        style: TextStyle(
                            fontSize: size.height * .027,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
            Spacer(),
            MediumIcon('heart.svg')
          ],
        ),
        SizedBox(height: size.height * .02),
      ],
    );
  }
}
