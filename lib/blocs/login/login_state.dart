part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String errEmail;
  final String msgPassword;
  final String errMsg;

  const LoginState({
    required this.email,
    required this.password,
    required this.errEmail,
    required this.errMsg,
    required this.msgPassword,
  });

  LoginState copyWith(
          {String? email,
          String? password,
          String? errEmail,
          String? errMsg,
          String? msgPassword}) =>
      LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        errEmail: errEmail ?? this.errEmail,
        errMsg: errMsg ?? this.errMsg,
        msgPassword: msgPassword ?? this.msgPassword,
      );

  @override
  List<Object> get props => [
        email,
        password,
        errEmail,
        errMsg,
        msgPassword,
      ];
}
