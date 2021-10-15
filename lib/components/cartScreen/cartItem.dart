import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';
import 'package:drohealthtest/customMethods/cartMethods/getNumberOfItems.dart';
import 'package:drohealthtest/models/drugModel.dart';
import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dropDown.dart';

class CartItem extends StatelessWidget {
  final DrugModel drugModel;

  const CartItem({Key? key, required this.drugModel}) : super(key: key);
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
                  height: size.width * .3,
                  child: Image.asset(drugModel.imageUrl),
                ),
                SizedBox(width: size.width * .05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(drugModel.name,
                        style: TextStyle(fontSize: size.width * .04)),
                    SizedBox(height: size.height * .005),
                    Text(drugModel.type,
                        style: TextStyle(
                            fontSize: size.width * .04, color: Colors.grey)),
                    SizedBox(height: size.height * .005),
                    Text(
                        '₦${drugModel.price * getNumberInCart(state, drugModel.name)}',
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
                          DropDown(drugModel: drugModel),
                          Spacer(),
                        ],
                      ),
                    ),
                    TextButton.icon(
                        onPressed: () {
                          context.read<CartCubit>().removeFromCart(drugModel);
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
