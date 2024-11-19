class UserCreationRequest {
  String? name;
  String? email;
  String? password;
  String lastName;
  int? age;
  String? gener;
  UserCreationRequest(
      {required this.name,
      required this.email,
      required this.password,
      required this.lastName});
}
