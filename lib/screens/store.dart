import 'package:drohealthtest/components/categoryCard.dart';
import 'package:drohealthtest/components/drugCard.dart';
import 'package:drohealthtest/components/input/searchTextField.dart';
import 'package:drohealthtest/components/mediumIcon.dart';
import 'package:drohealthtest/models/categoryCardModel.dart';
import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/mockdata.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: SizedBox(
              height: size.height * .03,
              child: SvgPicture.asset('assets/home.svg')),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: SizedBox(
                height: size.height * .03,
                child: SvgPicture.asset('assets/home.svg')),
            label: 'Sete')
      ]),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: DroColors.lightGrey,
        child: Column(
          children: [
            Container(
              height: size.height * .2,
              width: size.width * 3,
              decoration: BoxDecoration(
                  gradient: DroColors.purpleGradient,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(24))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .07),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Text('Pharmacy',
                            style: TextStyle(
                                fontSize: size.height * .027,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Spacer(),
                        MediumIcon('heart.svg'),
                        MediumIcon('delivery.svg'),
                      ],
                    ),
                    SizedBox(height: size.height * .02),
                    SearchTextField(),
                    SizedBox(height: size.height * .035),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                          child: Container(
                        color: DroColors.lightGrey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .07,
                              vertical: size.height * .015),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/pin.svg'),
                              SizedBox(width: 10),
                              Text.rich(
                                TextSpan(text: 'Delivery in ', children: [
                                  TextSpan(
                                      text: 'Lagos, NG',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                ]),
                              )
                            ],
                          ),
                        ),
                      )),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .07),
                          child: Column(
                            children: [
                              SizedBox(height: size.height * .01),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'CATEGORIES',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextButton(
                                    child: Text(
                                      'VIEW ALL',
                                      style: TextStyle(
                                          color: DroColors.purple,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: size.height * .13,
                          child: ListView.builder(
                            padding: EdgeInsets.only(left: size.width * .07),
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return CategoryCard(
                                cardModel: CategoryCardModel.fromJson(
                                    MockData.categories[index]),
                              );
                            },
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .07),
                          child: Column(
                            children: [
                              SizedBox(height: size.height * .02),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('SUGGESTIONS',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ]),
                              SizedBox(height: size.height * .01),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          height: size.height,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .07),
                            child: Column(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: size.height,
                                    child: GridView.builder(
                                      padding: EdgeInsets.only(bottom: 100),
                                      physics: BouncingScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: (size.width * .2) /
                                            (size.height * .15),
                                        crossAxisSpacing: 10,
                                      ),
                                      itemCount: 20,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return DrugCard();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
