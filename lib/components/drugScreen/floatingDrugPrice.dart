import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingDrugPrice extends StatelessWidget {
  final int amount;
  const FloatingDrugPrice({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('₦', style: TextStyle(fontSize: size.width * .04)),
            Text.rich(
              TextSpan(text: '$amount', children: [
                TextSpan(
                    text: '.00', style: TextStyle(fontSize: size.width * .04))
              ]),
              style: TextStyle(
                  fontSize: size.width * .065, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
