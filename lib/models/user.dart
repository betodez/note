class User {
  final String fullName;
  final String email;
  final String password;

  User({
    required this.fullName,
    required this.email,
    required this.password,
  });

  static User mapToUser(Map<String, String> map) => User(
        email: map['email'].toString(),
        fullName: map['fullName'].toString(),
        password: map['password'].toString(),
      );
}
