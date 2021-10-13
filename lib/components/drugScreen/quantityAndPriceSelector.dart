import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

import 'floatingDrugPrice.dart';

class QuantityAndPriceSelector extends StatelessWidget {
  const QuantityAndPriceSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Row(
      children: [
        Container(
          // width: size.width * .27,
          height: size.height * .045,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.remove, size: size.width * .046),
                  onPressed: () {}),
              Text('2',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * .053)),
              IconButton(
                icon: Icon(Icons.add, size: size.width * .046),
                onPressed: () {},
              )
            ],
          ),
        ),
        SizedBox(width: size.width * .02),
        Text(
          'Pack(s)',
          style: TextStyle(color: Colors.grey, fontSize: size.width * .045),
        ),
        Spacer(),
        FloatingDrugPrice(),
      ],
    );
  }
}
