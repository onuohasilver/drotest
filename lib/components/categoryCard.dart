import 'package:drohealthtest/models/categoryCardModel.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryCardModel cardModel;
  const CategoryCard({Key? key, required this.cardModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Padding(
      padding: EdgeInsets.only(right: size.width * .03),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(),
          height: size.height * .13,
          width: size.width * .3,
          child: Stack(
            children: [
              Container(
                  height: size.height * .13,
                  width: size.width * .3,
                  child: Image.asset(cardModel.imageUrl, fit: BoxFit.cover)),
              Container(
                height: size.height * .13,
                width: size.width * .3,
                color: Colors.black54,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        cardModel.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * .05,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
