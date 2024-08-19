part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}
final class CategoriesLoading extends CategoriesState {}
final class CategoriesSuccess extends CategoriesState {
  final List<Item> items;
  CategoriesSuccess({required this.items});
}
final class CategoriesFailure extends CategoriesState {
  final String errMessage;
  CategoriesFailure({required this.errMessage});
}
