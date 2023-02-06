part of 'user_bloc.dart';

class UserState extends Equatable {
  final String fullName;
  final String email;
  const UserState({
    required this.fullName,
    required this.email,
  });

  UserState copyWith({
    String? fullName,
    String? email,
  }) =>
      UserState(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
      );

  @override
  List<Object> get props => [fullName, email];
}
