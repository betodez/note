part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object> get props => [];
}

class UserFullNameEvent extends UserEvent {
  final String fullName;
  const UserFullNameEvent({required this.fullName});
}

class UserEmailEvent extends UserEvent {
  final String email;
  const UserEmailEvent({required this.email});
}

class UserAddNotaEvent extends UserEvent {
  final Nota nota;
  const UserAddNotaEvent({required this.nota});
}

class UserDeleteNotaEvent extends UserEvent {
  final Nota nota;
  const UserDeleteNotaEvent({required this.nota});
}

class UserContenidoEvent extends UserEvent {
  final String value;
  const UserContenidoEvent({required this.value});
}
