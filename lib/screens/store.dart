import 'package:drohealthtest/components/input/searchTextField.dart';
import 'package:drohealthtest/components/mediumIcon.dart';
import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: DroColors.lightGrey,
      child: Column(
        children: [
          Container(
            height: size.height * .2,
            width: size.width * 3,
            decoration: BoxDecoration(
                gradient: DroColors.purpleGradient,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(24))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .07),
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Text('Pharmacy',
                          style: TextStyle(
                              fontSize: size.height * .027,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      MediumIcon('heart.svg'),
                      MediumIcon('delivery.svg'),
                    ],
                  ),
                  SizedBox(height: size.height * .02),
                  SearchTextField(),
                  SizedBox(height: size.height * .035),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .07, vertical: size.height * .015),
            child: Row(
              children: [
                SvgPicture.asset('assets/pin.svg'),
                SizedBox(width: 10),
                Text.rich(
                  TextSpan(text: 'Delivery in ', children: [
                    TextSpan(
                        text: 'Lagos, NG',
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ]),
                )
              ],
            ),
          ),
          Container(
            height: size.height * .75,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .07),
              child: Column(
                children: [
                  SizedBox(height: size.height * .01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'CATEGORIES',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        child: Text(
                          'VIEW ALL',
                          style: TextStyle(
                              color: DroColors.purple,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
