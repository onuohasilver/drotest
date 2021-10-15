import 'package:drohealthtest/bloc/search_cubit/search_cubit.dart';
import 'package:drohealthtest/utilities/mockdata.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

searchTest() {
  late SearchCubit searchCubit;

  setUp(() {
    EquatableConfig.stringify = true;
    // cartCubit = CartCubit();
    searchCubit = SearchCubit();
  });

  test('Test Empty Search', () {
    searchCubit.makeSearch(MockData.drugs, '');
    expect(searchCubit.state.searchResult.isEmpty, true);
  });
  test('Test Search Actual Result', () {
    searchCubit.makeSearch(MockData.drugs, 'acti');
    expect(searchCubit.state.searchResult.length > 0, true);
  });
}
