import 'package:bloc/bloc.dart';
import 'package:fresh_fruits/features/item_details/data/repo/item_details_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/customer.dart';
import '../../../../../core/models/item.dart';

part 'item_details_state.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState> {
  final Item item;
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

  void postComment(String content, Customer customer, Item item) async {
    emit(ItemDetailsCommentLoading());
    var result = await itemDetailsRepo.postComment(content, customer, item);
    result.fold(
      (failure) =>
          emit(ItemDetailsCommentFailed(errMessage: failure.errMessage)),
      (successMessage) =>
          emit(ItemDetailsCommentPosted(successMessage: successMessage)),
    );
  }
}
