part of 'registrar_bloc.dart';

abstract class RegistrarState extends Equatable {
  final User user;
  final String errorFullName;
  final String errorEmail;
  final String errorPassword;

  const RegistrarState({
    required this.user,
    required this.errorFullName,
    required this.errorEmail,
    required this.errorPassword,
  });

  @override
  List<Object> get props => [errorEmail, errorFullName, errorPassword, user];
}

class RegistrarSetState extends RegistrarState {
  const RegistrarSetState(
      {required super.user,
      required super.errorFullName,
      required super.errorEmail,
      required super.errorPassword});
}
