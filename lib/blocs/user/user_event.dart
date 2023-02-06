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
