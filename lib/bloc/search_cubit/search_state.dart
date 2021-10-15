// part of 'search_cubit.dart';

import 'package:drohealthtest/models/drugModel.dart';
import 'package:equatable/equatable.dart';

class SearchFail extends SearchState {
  final List<DrugModel> searchResult;
  SearchFail(this.searchResult) : super(searchResult);

  @override
  List<Object> get props => [searchResult];
}

class SearchInitial extends SearchState {
  SearchInitial(List<DrugModel> searchResult) : super(searchResult);
}

abstract class SearchState extends Equatable {
  final List<DrugModel> searchResult;
  const SearchState(this.searchResult);

  @override
  List<Object> get props => [searchResult];
}

class SearchSuccess extends SearchState {
  final List<DrugModel> searchResult;
  SearchSuccess(this.searchResult) : super(searchResult);

  @override
  List<Object> get props => [searchResult];
}
