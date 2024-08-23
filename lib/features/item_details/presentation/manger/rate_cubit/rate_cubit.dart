import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/item.dart';
import '../../../data/repo/item_details_repo.dart';

part 'rate_state.dart';

class RateCubit extends Cubit<RateState> {
  final ItemDetailsRepo itemDetailsRepo;
  RateCubit(this.itemDetailsRepo) : super(RateInitial());

  Future<void> rateIt(Item item, double rate) async {
    emit(RateLoading());
    var result = await itemDetailsRepo.ratingItem(item, rate);
    result.fold(
      (l) => emit(RateFailure(errMessage: l.errMessage)),
      (r) => emit(RateSuccess(message: r)),
    );
  }
}
