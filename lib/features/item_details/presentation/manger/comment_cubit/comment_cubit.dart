import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/customer.dart';
import '../../../../../core/models/item.dart';
import '../../../data/models/comment.dart';
import '../../../data/repo/item_details_repo.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  final ItemDetailsRepo itemDetailsRepo;
  List<Comment>? itemComments;
  CommentCubit(this.itemDetailsRepo) : super(CommentInitial());

  void postComment(String content, Customer customer , Item item) async {
    emit(CommentLoading());
    var result = await itemDetailsRepo.postComment(content, customer, item);
    result.fold(
          (failure) =>
          emit(CommentFailed(errMessage: failure.errMessage)),
          (successMessage) {
        emit(CommentPosted(successMessage: successMessage));
      },
    );
    await fetchComments(item);
  }

  Future<void> fetchComments(Item item) async {
    emit(CommentLoading());
    var result = await itemDetailsRepo.getItemComments(item);
    result.fold(
          (failure) =>
          emit(CommentFailed(errMessage: failure.errMessage)),
          (comments) {
        itemComments = comments;
        emit((CommentPosted(successMessage: '')));
      },
    );
  }
}
