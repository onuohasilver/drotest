import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../generic/mediumIcon.dart';

class GenericDrugTopBar extends StatelessWidget {
  const GenericDrugTopBar({
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
                label: Text('Pharmacy',
                    style: TextStyle(
                        fontSize: size.height * .027,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))),
            Spacer(),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return MediumIcon('cart.svg',
                    isActive: state.cartItems.isNotEmpty);
              },
            )
          ],
        ),
        SizedBox(height: size.height * .02),
      ],
    );
  }
}
