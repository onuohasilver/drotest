import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

class DrugCard extends StatelessWidget {
  const DrugCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        width: size.width * .2,
        height: size.height * .5,
        child: Material(
          clipBehavior: Clip.none,
          borderRadius: BorderRadius.circular(10),
          elevation: 5,
          shadowColor: Colors.grey[100]!.withOpacity(.3),
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Container(
                    height: size.height * .18,
                    child: Image.asset(
                      'assets/infant.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: size.height * .01),
                Padding(
                  padding: EdgeInsets.only(left: size.width * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
