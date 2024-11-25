class UserEntity {
  final String firstName;
  final String userId;
  final String image;
  final String email;
  final int gender;
  final String lastName;
  UserEntity({
    required this.email,
    required this.image,
    required this.gender,
    required this.firstName,
    required this.lastName,
    required this.userId,
  });
}
