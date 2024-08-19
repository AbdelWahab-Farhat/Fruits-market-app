import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/item.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  late List<Item> allItems;
  SearchCubit(this.allItems) : super(SearchInitial());



  searchItems(String query) {
    emit(SearchLoading());
    if (query.isEmpty) {
      emit(SearchInitial());
    }
    var filteredItems = allItems.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();

    emit(SearchFiltered(items: filteredItems));
    if (filteredItems.isEmpty) {
      emit(SearchNotFound(message: 'No Items Found'));
    }
  }
}
