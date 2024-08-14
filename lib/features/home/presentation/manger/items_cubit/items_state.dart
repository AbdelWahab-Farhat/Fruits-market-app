part of 'items_cubit.dart';

@immutable
sealed class ItemsState {}

final class ItemsInitial extends ItemsState {}
final class ItemsLoading extends ItemsState {}
final class ItemsFailure extends ItemsState {
  final String errMessage;
  ItemsFailure({required this.errMessage});
}
final class ItemsSuccess extends ItemsState {
  final List<Item> items;
  ItemsSuccess({required this.items});
}
