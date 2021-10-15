import 'package:drohealthtest/components/generic/mediumIcon.dart';
import 'package:drohealthtest/components/input/searchTextField.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

class StoreTopBar extends StatelessWidget {
  const StoreTopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Column(
      children: [
        SizedBox(height: size.height * .07),
        Row(
          children: [
            Text('Pharmacy',
                style: TextStyle(
                    fontSize: size.height * .027,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Spacer(),
            MediumIcon('heart.svg', isActive: true),
            MediumIcon('delivery.svg')
          ],
        ),
        SizedBox(height: size.height * .02),
        SearchTextField(),
        SizedBox(height: size.height * .035),
      ],
    );
  }
}
