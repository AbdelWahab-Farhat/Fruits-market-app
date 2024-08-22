part of 'item_details_cubit.dart';

@immutable
sealed class ItemDetailsState {}

final class ItemDetailsInitial extends ItemDetailsState {}
final class ItemDetailsCommentPosted extends ItemDetailsState {
  final String successMessage;
  ItemDetailsCommentPosted({required this.successMessage});
}
final class ItemDetailsCommentFailed extends ItemDetailsState {
  final String errMessage;
  ItemDetailsCommentFailed({required this.errMessage});
}
final class ItemDetailsCommentLoading extends ItemDetailsState {}
