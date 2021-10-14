import 'package:drohealthtest/models/drugModel.dart';
import 'package:drohealthtest/screens/genericDrug.dart';
import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

class DrugCard extends StatelessWidget {
  final DrugModel drugModel;
  const DrugCard({
    Key? key,
    required this.drugModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Material(
        clipBehavior: Clip.none,
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        shadowColor: Colors.grey[100]!.withOpacity(.3),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DrugScreen(drugModel: drugModel)));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Container(
                  height: size.height * .18,
                  color: DroColors.lightGrey,
                  child: Image.asset(
                    drugModel.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: size.height * .01),
              Padding(
                padding: EdgeInsets.only(left: size.width * .02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * .01),
                    Text(drugModel.name,
                        style: TextStyle(fontSize: size.width * .037)),
                    SizedBox(height: size.height * .005),
                    Text(drugModel.type,
                        style: TextStyle(
                            fontSize: size.width * .037, color: Colors.grey)),
                    SizedBox(height: size.height * .005),
                    Text('₦${drugModel.price}',
                        style: TextStyle(
                            fontSize: size.width * .045,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
