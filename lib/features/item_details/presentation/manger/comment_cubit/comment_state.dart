part of 'comment_cubit.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}
final class CommentLoading extends CommentState {}

final class CommentPosted extends CommentState {
  final String successMessage;
  CommentPosted({required this.successMessage});
}
final class CommentFailed extends CommentState {
  final String errMessage;
  CommentFailed({required this.errMessage});
}
