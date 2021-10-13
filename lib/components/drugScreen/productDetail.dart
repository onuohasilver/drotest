import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailContainer extends StatelessWidget {
  final String icon, title, subtitle;
  const ProductDetailContainer({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Container(
      height: size.height * .06,
      width: size.width * .4,
      child: Row(
        children: [
          SizedBox(
            width: size.width * .11,
            height: size.height * .036,
            child: SvgPicture.asset(
              'assets/$icon',
              color: DroColors.purple,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: DroColors.middleBlue.withOpacity(.7),
                  fontSize: size.width * .025,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                    color: DroColors.middleBlue,
                    fontSize: size.width * .036,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
