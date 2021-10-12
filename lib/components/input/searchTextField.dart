import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return SizedBox(
      height: size.height * .04,
      child: TextField(
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            prefixIcon: Icon(Icons.search,
                color: Colors.white, size: size.height * .02),
            fillColor: Colors.white24,
            filled: true,
            hintText: 'Search',
            hintStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
