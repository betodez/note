part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEmailEvent extends LoginEvent {
  final String email;
  const LoginEmailEvent({required this.email});
}

class LoginErrorEmailEvent extends LoginEvent {
  final String errEmail;
  const LoginErrorEmailEvent({required this.errEmail});
}

class LoginPasswordEvent extends LoginEvent {
  final String password;
  const LoginPasswordEvent({required this.password});
}

class LoginMsgPasswordEvent extends LoginEvent {
  final String msg;
  const LoginMsgPasswordEvent({required this.msg});
}

class LoginMsgEvent extends LoginEvent {
  final String msg;
  const LoginMsgEvent({required this.msg});
}
