import 'package:drohealthtest/components/drugScreen/productDetail.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProductDetailContainer(
              icon: 'drug.svg',
              subtitle: '8 x 12 tablets (96)',
              title: 'PACK SIZE',
            ),
            ProductDetailContainer(
              icon: 'qr.svg',
              subtitle: 'PRO23232311',
              title: 'PRODUCT ID',
            ),
          ],
        ),
        SizedBox(height: size.height * .01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProductDetailContainer(
              icon: 'drugsingle.svg',
              subtitle: 'Paracetamol',
              title: 'CONSTITUENTS',
            ),
            ProductDetailContainer(
              icon: 'pack.svg',
              subtitle: 'Packs',
              title: 'DISPENSED IN',
            ),
          ],
        )
      ],
    );
  }
}
