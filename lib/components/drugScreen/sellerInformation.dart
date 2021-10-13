import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

class SellerInformation extends StatelessWidget {
  const SellerInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Row(
      children: [
        SizedBox(
          height: size.height * .07,
          width: size.width * .1,
          child: Material(
            elevation: 1,
            color: Colors.white,
            type: MaterialType.circle,
            child: Image.asset(
              'assets/emzor.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(width: size.width * .03),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SOLD BY', style: TextStyle(color: Colors.grey)),
            Text('Emzor Pharmaceuticals',
                style: TextStyle(
                    color: DroColors.middleBlue,
                    fontSize: size.width * .04,
                    fontWeight: FontWeight.bold))
          ],
        ),
        Spacer(),
        Material(
          color: DroColors.purple.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(Icons.favorite_outline, color: DroColors.purple),
          ),
        )
      ],
    );
  }
}
