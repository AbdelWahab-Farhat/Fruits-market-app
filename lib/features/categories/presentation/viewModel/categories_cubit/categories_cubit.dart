import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/firebase/firestore_service.dart';
import '../../../../../core/models/item.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());


  Future <void> fetchItems() async {
    emit(CategoriesLoading());
    var result = await FireStoreService.fetchItems();
    result.fold(
      (failure) => emit(CategoriesFailure(errMessage: failure.errMessage)),
      (items) => emit(CategoriesSuccess(items: items)),
    );
  }
}
