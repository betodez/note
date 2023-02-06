part of 'registrar_bloc.dart';

class RegistrarState extends Equatable {
  final String errorFullName;
  final String errorEmail;
  final String errorPassword;
  final String errorRepetirPassword;
  final String message;

  const RegistrarState({
    required this.message,
    required this.errorFullName,
    required this.errorEmail,
    required this.errorPassword,
    required this.errorRepetirPassword,
  });

  RegistrarState copyWith({
    String? message,
    String? errorFullName,
    String? errorEmail,
    String? errorPassword,
    String? errorRepetirPassword,
  }) =>
      RegistrarState(
          message: message ?? this.message,
          errorEmail: errorEmail ?? this.errorEmail,
          errorFullName: errorFullName ?? this.errorFullName,
          errorPassword: errorPassword ?? this.errorPassword,
          errorRepetirPassword:
              errorRepetirPassword ?? this.errorRepetirPassword);

  @override
  List<Object> get props => [
        errorEmail,
        errorFullName,
        errorPassword,
        errorRepetirPassword,
        message,
      ];
}
