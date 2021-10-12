import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: DroColors.lightGrey,
      child: Column(children: [
        Container(
            height: size.height * .24,
            width: size.width * 3,
            decoration: BoxDecoration(
              gradient: DroColors.purpleGradient,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ))
      ]),
    );
  }
}
