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
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: size.width * .2,
        height: size.height * .5,
        child: Material(
          clipBehavior: Clip.none,
          borderRadius: BorderRadius.circular(10),
          elevation: 5,
          shadowColor: Colors.black26,
          color: Colors.white,
        ),
      ),
    );
  }
}
