import 'package:drohealthtest/components/drugScreen/floatingDrugPrice.dart';
import 'package:drohealthtest/components/drugScreen/productDetail.dart';
import 'package:drohealthtest/components/mediumIcon.dart';
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
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            TopBar(
                child: Column(
              children: [
                SizedBox(height: size.height * .07),
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
                    MediumIcon('cart.svg')
                  ],
                ),
                SizedBox(height: size.height * .02),
              ],
            )),
            SizedBox(height: size.height * .05),
            SizedBox(
              height: size.height * .15,
              width: size.width * .7,
              child: Image.asset('assets/medicine1.png'),
            ),
            SizedBox(height: size.height * .02),
            Text('Paracetamol',
                style: TextStyle(
                    fontSize: size.width * .055, fontWeight: FontWeight.bold)),
            Text('Tablet •  500mg',
                style:
                    TextStyle(fontSize: size.width * .04, color: Colors.grey)),
            SizedBox(height: size.height * .02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .07),
              child: Column(
                children: [
                  Row(
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
                                  fontSize: size.width * .046,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      Spacer(),
                      Material(
                        color: DroColors.purple.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.favorite_outline,
                              color: DroColors.purple),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * .02),
                  Row(
                    children: [
                      Container(
                        // width: size.width * .27,
                        height: size.height * .06,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon:
                                    Icon(Icons.remove, size: size.width * .046),
                                onPressed: () {}),
                            Text('2',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * .053)),
                            IconButton(
                              icon: Icon(Icons.add, size: size.width * .046),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: size.width * .02),
                      Text(
                        'Pack(s)',
                        style: TextStyle(
                            color: Colors.grey, fontSize: size.width * .045),
                      ),
                      Spacer(),
                      FloatingDrugPrice(),
                    ],
                  ),
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
                            subtitle: 'PRO232311',
                            title: 'PRODUCT ID',
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * .02),
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
