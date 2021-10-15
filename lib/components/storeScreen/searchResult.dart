import 'package:drohealthtest/bloc/search_cubit/search_state.dart';
import 'package:drohealthtest/components/drugScreen/drugCard.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';

class SearchResultDisplay extends StatelessWidget {
  final SearchState state;
  const SearchResultDisplay(
    this.state, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .07),
      child: GridView.builder(
        padding: EdgeInsets.only(bottom: 100),
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 3,
          childAspectRatio: (size.width * .2) / (size.height * .13),
          crossAxisSpacing: 3,
        ),
        itemCount: state.searchResult.length,
        itemBuilder: (BuildContext context, int index) {
          return DrugCard(drugModel: state.searchResult[index]);
        },
      ),
    );
  }
}
