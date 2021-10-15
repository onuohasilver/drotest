import 'package:drohealthtest/customMethods/unimplementedSnack.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MediumIcon extends StatelessWidget {
  final String iconUrl;
  final bool isActive;
  const MediumIcon(
    this.iconUrl, {
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Padding(
      padding: EdgeInsets.only(left: size.width * .04),
      child: SizedBox(
        height: size.height * .028,
        width: size.width * .08,
        child: GestureDetector(
          onTap: () => displaySnack(context),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child:
                      SvgPicture.asset('assets/$iconUrl', color: Colors.white)),
              if (isActive)
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    height: 10,
                    width: 10,
                    child: Material(
                        color: Colors.amber, type: MaterialType.circle),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
