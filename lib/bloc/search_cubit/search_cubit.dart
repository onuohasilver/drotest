import 'package:bloc/bloc.dart';
import 'package:drohealthtest/models/drugModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial([]));

  void clearSearch() {
    emit(SearchInitial([]));
  }

  ///Retrieves a list of drugs based on the parsed search criteria

  void makeSearch(List<Map> allDrugs, String searchItem) {
    List<DrugModel> allDrugsModel = List.generate(
        allDrugs.length, (index) => DrugModel.fromJson(allDrugs[index]));

    ///An empty search should return a Search initial state
    if (searchItem != '') {
      emit(SearchSuccess([
        ...allDrugsModel
            .where((element) =>
                element.name.toLowerCase().contains(searchItem.toLowerCase()))
            .toList()
      ]));
    } else {
      emit(SearchInitial([]));
    }
  }
}
