import 'package:drohealthtest/components/drugScreen/drugCard.dart';
import 'package:drohealthtest/models/drugModel.dart';
import 'package:drohealthtest/utilities/mockdata.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/widgets.dart';

class DrugsGridView extends StatelessWidget {
  const DrugsGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Container(
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .07),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: size.height,
                child: GridView.builder(
                  padding: EdgeInsets.only(bottom: 100),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 3,
                    childAspectRatio: (size.width * .2) / (size.height * .135),
                    crossAxisSpacing: 3,
                  ),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return DrugCard(
                        drugModel: DrugModel.fromJson(MockData.drugs[index]));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
