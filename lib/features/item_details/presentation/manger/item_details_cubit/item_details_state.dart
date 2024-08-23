part of 'item_details_cubit.dart';

@immutable
sealed class ItemDetailsState {}

final class ItemDetailsInitial extends ItemDetailsState {}
final class ItemDetailsSuccess extends ItemDetailsState {
  final String successMessage;
  ItemDetailsSuccess({required this.successMessage});
}
final class ItemDetailsFailed extends ItemDetailsState {
  final String errMessage;
  ItemDetailsFailed({required this.errMessage});
}
final class ItemDetailsLoading extends ItemDetailsState {}
