import 'package:drohealthtest/models/categoryCardModel.dart';
import 'package:drohealthtest/utilities/mockdata.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

import 'categoryCard.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return SizedBox(
      height: size.height * .1,
      child: ListView.builder(
        padding: EdgeInsets.only(left: size.width * .07),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(
            cardModel: CategoryCardModel.fromJson(MockData.categories[index]),
          );
        },
      ),
    );
  }
}
