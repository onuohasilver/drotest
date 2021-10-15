import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';
import 'package:drohealthtest/customMethods/cartMethods/getNumberOfItems.dart';
import 'package:drohealthtest/models/drugModel.dart';
import 'package:drohealthtest/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDown extends StatefulWidget {
  final DrugModel drugModel;
  DropDown({Key? key, required this.drugModel}) : super(key: key);
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (_, state) {
        return DropdownButton(
          value: getNumberInCart(state, widget.drugModel.name),
          onChanged: (int? value) {
            ///Reemove all Previous occurences of the drug in the cart
            for (int x = 1;
                x <= getNumberInCart(state, widget.drugModel.name);
                x++) {
              _.read<CartCubit>().removeFromCart(widget.drugModel);
            }

            ///add new instance of the drug based on the selected quantity
            for (int x = 1; x <= value!; x++) {
              _.read<CartCubit>().addToCart(widget.drugModel);
            }
          },
          items: List.generate(
              20,
              (index) => DropdownMenuItem(
                  value: index + 1, child: Text('${index + 1}'))),
          icon: Icon(Icons.arrow_drop_down_rounded, color: DroColors.purple),
        );
      },
    );
  }
}
