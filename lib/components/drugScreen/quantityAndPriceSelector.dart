import 'package:drohealthtest/bloc/drug_quantity_cubit/drugquantity_cubit.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'floatingDrugPrice.dart';

class QuantityAndPriceSelector extends StatefulWidget {
  final int amount;
  const QuantityAndPriceSelector({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  _QuantityAndPriceSelectorState createState() =>
      _QuantityAndPriceSelectorState();
}

class _QuantityAndPriceSelectorState extends State<QuantityAndPriceSelector> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return BlocBuilder<CounterCubit, int>(
      builder: (_, state) {
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
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity -= 1;
                        });
                        _.read<CounterCubit>().decrement();
                      }),
                  Text('$quantity',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * .053)),
                  IconButton(
                    icon: Icon(Icons.add, size: size.width * .046),
                    onPressed: () {
                      _.read<CounterCubit>().increment();
                      setState(() {
                        quantity += 1;
                      });
                    },
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
            FloatingDrugPrice(amount: widget.amount * quantity),
          ],
        );
      },
    );
  }
}
