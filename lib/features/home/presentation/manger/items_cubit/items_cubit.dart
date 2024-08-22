import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/firebase/firestore_service.dart';
import '../../../../../core/models/item.dart';

part 'items_state.dart';

class ItemsCubit extends Cubit<ItemsState> {
  final FireStoreService fireStoreService;
  ItemsCubit({required this.fireStoreService}) : super(ItemsInitial());

  void fetchItems() async {
    emit(ItemsLoading());
    var result = await FireStoreService.fetchItems();
    result.fold(
      (failure) => ItemsFailure(errMessage: failure.errMessage),
      (data) => emit(ItemsSuccess(items: data)),
    );
  }
}
