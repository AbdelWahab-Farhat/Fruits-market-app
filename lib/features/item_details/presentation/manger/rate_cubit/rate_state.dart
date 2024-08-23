part of 'rate_cubit.dart';

@immutable
sealed class RateState {}

final class RateInitial extends RateState {}
final class RateLoading extends RateState {}
final class RateSuccess extends RateState {
  final String message;
  RateSuccess({required this.message});
}
final class RateFailure extends RateState {
  final String errMessage;
  RateFailure({required this.errMessage});
}