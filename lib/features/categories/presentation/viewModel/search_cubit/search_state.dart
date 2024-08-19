part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class SearchNotFound extends SearchState {
  final String message;
  SearchNotFound({required this.message});
}
final class SearchFiltered  extends SearchState {
  final List<Item> items;
  SearchFiltered({required this.items});

}