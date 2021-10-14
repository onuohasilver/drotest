import 'package:drohealthtest/utilities/colors.dart';
import 'package:flutter/material.dart';

///Creates a simple snackbr
void displaySnack(
  BuildContext context,
) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: 40,
    content: Text(
      'Unimplemented Function',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: DroColors.purple,
    duration: Duration(seconds: 2),
  ));
}
