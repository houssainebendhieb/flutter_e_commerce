part of 'user_info_display_cubit.dart';

@immutable
sealed class UserInfoDisplayState {}

final class UserInfoDisplayInitial extends UserInfoDisplayState {}

final class UserInfoDisplayLoading extends UserInfoDisplayState {}

final class UserInfoDisplaySucces extends UserInfoDisplayState {
  
}



final class UserInfoDisplayFailure extends UserInfoDisplayState {
  final String errorMessage;
  UserInfoDisplayFailure({required this.errorMessage});
}
