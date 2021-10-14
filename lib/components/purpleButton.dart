import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

class PurpleButton extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  const PurpleButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        height: size.height * .055,
        width: size.width * .8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: DroColors.purpleGradient),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: onTap,
              child: child),
        ),
      ),
    );
  }
}
