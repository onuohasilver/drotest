import 'package:drohealthtest/bloc/cart_cubit/cart_cubit.dart';
import 'package:drohealthtest/bloc/drug_quantity_cubit/drugquantity_cubit.dart';
import 'package:drohealthtest/components/drugScreen/addToCartModal.dart';
import 'package:drohealthtest/components/drugScreen/drugCard.dart';
import 'package:drohealthtest/components/drugScreen/drugTopBar.dart';
import 'package:drohealthtest/components/drugScreen/productDetails.dart';
import 'package:drohealthtest/components/drugScreen/quantityAndPriceSelector.dart';
import 'package:drohealthtest/components/drugScreen/sellerInformation.dart';
import 'package:drohealthtest/components/generic/topBar.dart';
import 'package:drohealthtest/components/input/purpleButton.dart';
import 'package:drohealthtest/models/drugModel.dart';
import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/mockdata.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrugScreen extends StatelessWidget {
  final DrugModel drugModel;
  const DrugScreen({Key? key, required this.drugModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Material(
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: size.height * 1.25,
              child: Column(
                children: [
                  SizedBox(height: size.height * .17),
                  SizedBox(
                    height: size.height * .2,
                    width: size.width * .7,
                    child: Image.asset(drugModel.imageUrl),
                  ),
                  SizedBox(height: size.height * .01),
                  Text(drugModel.name,
                      style: TextStyle(
                          fontSize: size.width * .055,
                          fontWeight: FontWeight.bold)),
                  Text(drugModel.type,
                      style: TextStyle(
                          fontSize: size.width * .04, color: Colors.grey)),
                  SizedBox(height: size.height * .01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .07),
                    child: Column(
                      children: [
                        SellerInformation(),
                        SizedBox(height: size.height * .02),
                        QuantityAndPriceSelector(amount: drugModel.price),
                        SizedBox(height: size.height * .02),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'PRODUCT DETAILS',
                            style: TextStyle(
                                color: DroColors.middleBlue.withOpacity(.7),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: size.height * .01),
                        ProductDetails(),
                        SizedBox(height: size.height * .02),
                        Text(
                            '1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets',
                            style: TextStyle(
                                color: Colors.grey,
                                height: 1.5,
                                fontSize: size.width * .035)),
                        SizedBox(height: size.height * .02),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Similar Products',
                              style: TextStyle(
                                  fontSize: size.width * .04,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      height: size.height * .3,
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: size.width * .07),
                        physics: BouncingScrollPhysics(),
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: size.width * .4,
                            height: size.height * .3,
                            child: DrugCard(
                              drugModel:
                                  DrugModel.fromJson(MockData.drugs[index]),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
              height: size.height * .15,
              child: TopBar(child: GenericDrugTopBar())),
          BlocBuilder<CartCubit, CartState>(
            builder: (_, state) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: PurpleButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart_outlined, color: Colors.white),
                      SizedBox(width: size.width * .01),
                      Text('Add to cart',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold))
                    ],
                  ),
                  onTap: () {
                    int quantity = _.read<CounterCubit>().state;
                    for (int x = 1; x <= quantity; x++) {
                      _.read<CartCubit>().addToCart(drugModel);
                    }
                    _.read<CounterCubit>().reset();
                    showAddToCartModal(context);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
