import 'package:drohealthtest/cubit/cart_cubit.dart';
import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatefulWidget {
  final int index;
  const CartItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          height: size.height * .11,
          width: size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .04),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.width * .2,
                  child: Image.asset('assets/medicine1.png'),
                ),
                SizedBox(width: size.width * .05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Paracetamol',
                        style: TextStyle(fontSize: size.width * .04)),
                    SizedBox(height: size.height * .005),
                    Text('Tablet •  500mg',
                        style: TextStyle(
                            fontSize: size.width * .04, color: Colors.grey)),
                    SizedBox(height: size.height * .005),
                    Text('₦500',
                        style: TextStyle(
                            fontSize: size.width * .045,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * .15,
                      height: size.height * .045,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(
                            flex: 2,
                          ),
                          Text('1'),
                          Icon(Icons.arrow_drop_down_rounded,
                              color: DroColors.purple),
                          Spacer(),
                        ],
                      ),
                    ),
                    TextButton.icon(
                        onPressed: () {
                          context.read<CartCubit>().addToCart(widget.index);
                        },
                        icon:
                            Icon(Icons.delete_outline, color: DroColors.purple),
                        label: Text(
                          'Remove',
                          style: TextStyle(color: DroColors.purple),
                        ))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
