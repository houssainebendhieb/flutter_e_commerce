part of 'age_cubit.dart';

@immutable
sealed class AgeState {}

final class AgeInitial extends AgeState {}

final class AgeFailure extends AgeState {
  final String message;
  AgeFailure({required this.message});
}

final class AgeLoading extends AgeState {}

final class AgeSucces extends AgeState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> listAges;
  AgeSucces({required this.listAges});
}
