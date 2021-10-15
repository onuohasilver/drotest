import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final Widget child;
  const TopBar({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Container(
      // height: size.height * .2,
      width: size.width * 3,
      decoration: BoxDecoration(
          gradient: DroColors.purpleGradient,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .07),
          child: child),
    );
  }
}
