part of 'registrar_bloc.dart';

abstract class RegistrarEvent extends Equatable {
  const RegistrarEvent();

  @override
  List<Object> get props => [];
}

class RegistrarUsuarioEvent extends RegistrarEvent {
  final User user;
  final String errorFullName;
  final String errorEmail;
  final String errorPassword;

  const RegistrarUsuarioEvent(
      {required this.user,
      required this.errorFullName,
      required this.errorEmail,
      required this.errorPassword});
}
