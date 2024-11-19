part of 'button_cubit.dart';

@immutable
sealed class ButtonState {}

final class ButtonInitial extends ButtonState {}

final class ButtonSucces extends ButtonState {}

final class ButtonFailure extends ButtonState {
  final String errorMessage;
  ButtonFailure({required this.errorMessage});
}

final class ButtonLoading extends ButtonState {}
