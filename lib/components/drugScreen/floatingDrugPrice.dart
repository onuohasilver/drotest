import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

class FloatingDrugPrice extends StatelessWidget {
  const FloatingDrugPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('₦', style: TextStyle(fontSize: size.width * .04)),
        Text.rich(
          TextSpan(text: '600', children: [
            TextSpan(text: '.00', style: TextStyle(fontSize: size.width * .04))
          ]),
          style: TextStyle(
              fontSize: size.width * .065, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
