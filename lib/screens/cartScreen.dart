import 'package:drohealthtest/components/cartScreen/cartTopBar.dart';
import 'package:drohealthtest/components/topBar.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
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
                Container(
                  height: size.height * .13,
                  width: size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .04),
                    child: Row(
                      children: [
                        SizedBox(
                          height: size.width * .3,
                          child: Image.asset('assets/medicine1.png'),
                        ),
                        SizedBox(width: size.width * .05),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Paracetamol',
                                style: TextStyle(fontSize: size.width * .04)),
                            SizedBox(height: size.height * .005),
                            Text('Tablet •  500mg',
                                style: TextStyle(
                                    fontSize: size.width * .04,
                                    color: Colors.grey)),
                            SizedBox(height: size.height * .005),
                            Text('₦500',
                                style: TextStyle(
                                    fontSize: size.width * .045,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Spacer(),
                        Column(children: [])
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
