import 'package:drohealthtest/utilities/colors.dart';
import 'package:flutter/material.dart';

///Creates a simple snackbr
void displaySnack(
  BuildContext context,
) {
  showDialog(
      context: context,
      builder: (context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'This is an unimplemented feature',
                textAlign: TextAlign.center,
                style: TextStyle(color: DroColors.purple),
              ),
            ),
          ));
}
