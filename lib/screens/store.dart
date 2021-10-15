import 'package:drohealthtest/bloc/search_cubit/search_cubit.dart';
import 'package:drohealthtest/bloc/search_cubit/search_state.dart';
import 'package:drohealthtest/components/generic/bottombar.dart';
import 'package:drohealthtest/components/generic/topBar.dart';
import 'package:drohealthtest/components/storeScreen/categoryListView.dart';
import 'package:drohealthtest/components/storeScreen/customFAB.dart';
import 'package:drohealthtest/components/storeScreen/drugsGridView.dart';
import 'package:drohealthtest/components/storeScreen/searchResult.dart';
import 'package:drohealthtest/components/storeScreen/storeTopBar.dart';
import 'package:drohealthtest/customMethods/unimplementedSnack.dart';
import 'package:drohealthtest/utilities/colors.dart';
import 'package:drohealthtest/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final ScrollController scrollController = ScrollController();
  bool switchFAB = false;
  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(),
      floatingActionButton: CustomFab(switchFAB),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            TopBar(
              child: StoreTopBar(),
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return state.searchResult.isNotEmpty
                      ? SearchResultDisplay(state)
                      : Container(
                          color: Colors.white,
                          child: NotificationListener(
                            onNotification: (ScrollNotification scrollInfo) {
                              setState(() {
                                if (scrollInfo.metrics.pixels > 0.0) {
                                  switchFAB = true;
                                } else {
                                  switchFAB = false;
                                }
                              });

                              return true;
                            },
                            child: CustomScrollView(
                                physics: BouncingScrollPhysics(),
                                controller: scrollController,
                                slivers: [
                                  SliverToBoxAdapter(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          color: DroColors.lightGrey,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * .07,
                                                vertical: size.height * .015),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/pin.svg'),
                                                SizedBox(width: 10),
                                                Text.rich(
                                                  TextSpan(
                                                      text: 'Delivery in ',
                                                      children: [
                                                        TextSpan(
                                                            text: 'Lagos, NG',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold))
                                                      ]),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: size.height * .01),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * .07),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'CATEGORIES',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              TextButton(
                                                child: Text(
                                                  'VIEW ALL',
                                                  style: TextStyle(
                                                      color: DroColors.purple,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                onPressed: () =>
                                                    () => displaySnack(context),
                                              ),
                                            ],
                                          ),
                                        ),
                                        CategoryListView(),
                                        SizedBox(height: size.height * .02),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * .07),
                                          child: Text('SUGGESTIONS',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(height: size.height * .01),
                                        DrugsGridView(),
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
