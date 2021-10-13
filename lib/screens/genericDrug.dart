import 'package:drohealthtest/components/drugCard.dart';
import 'package:drohealthtest/components/drugScreen/addToCartModal.dart';
import 'package:drohealthtest/components/drugScreen/drugTopBar.dart';
import 'package:drohealthtest/components/drugScreen/productDetail.dart';
import 'package:drohealthtest/components/drugScreen/quantityAndPriceSelector.dart';
import 'package:drohealthtest/components/drugScreen/sellerInformation.dart';
import 'package:drohealthtest/components/purpleButton.dart';
import 'package:drohealthtest/components/topBar.dart';
import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

class DrugScreen extends StatelessWidget {
  const DrugScreen({Key? key}) : super(key: key);

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
                    child: Image.asset('assets/medicine1.png'),
                  ),
                  SizedBox(height: size.height * .01),
                  Text('Paracetamol',
                      style: TextStyle(
                          fontSize: size.width * .055,
                          fontWeight: FontWeight.bold)),
                  Text('Tablet •  500mg',
                      style: TextStyle(
                          fontSize: size.width * .04, color: Colors.grey)),
                  SizedBox(height: size.height * .01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .07),
                    child: Column(
                      children: [
                        SellerInformation(),
                        SizedBox(height: size.height * .02),
                        QuantityAndPriceSelector(),
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
                        Column(
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
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Text(
                            '1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: size.width * .042)),
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
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: size.width * .4,
                            height: size.height * .3,
                            child: DrugCard(),
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
          PurpleButton(
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
            onTap: () => showAddToCartModal(context),
          )
        ],
      ),
    );
  }
}
