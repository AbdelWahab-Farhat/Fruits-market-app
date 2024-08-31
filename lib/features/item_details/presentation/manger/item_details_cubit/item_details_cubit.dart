import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_fruits/core/firebase/firestore_service.dart';
import 'package:fresh_fruits/features/item_details/data/repo/item_details_repo.dart';
import 'package:meta/meta.dart';
import '../../../../../core/models/customer.dart';
import '../../../../../core/models/item.dart';

part 'item_details_state.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState> {
  Item item;
  final ItemDetailsRepo itemDetailsRepo;
  int quantity = 1;
  ItemDetailsCubit({required this.itemDetailsRepo, required this.item})
      : super(ItemDetailsInitial());

  void quantityIncrement() {
    if (quantity > 100) {
      return;
    }
    quantity++;
    emit(ItemDetailsInitial());
  }

  void quantityDecrement() {
    if (quantity <= 1) {
      return;
    }
    quantity--;
    emit(ItemDetailsInitial());
  }

  double calculateRate() {
    if (item.reviews == 0) {
      return 0;
    } else {
      return item.rate / item.reviews;
    }
  }

    Future<void> updatedItem()async {
    var query = await FirebaseFirestore.instance.collection(FireStoreService.items_Collection).doc(item.ID).get();
    item = Item.fromJson(query.data() as Map<String, dynamic>);
      emit(ItemDetailsInitial());
    }

    Future<void> addItemToCart (Customer customer) async {
      emit(ItemDetailsLoading());
      var result = await itemDetailsRepo.addItemToCart(item, quantity,customer);
      result.fold(
        (failure) => emit(ItemDetailsFailed(errMessage: failure.errMessage)),
        (successMessage) {
          emit(ItemDetailsSuccess(successMessage: successMessage));
        },
      );
    }
}
