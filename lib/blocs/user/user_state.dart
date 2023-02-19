part of 'user_bloc.dart';

class UserState extends Equatable {
  final String fullName;
  final String email;
  final List<Nota> lstNotas;

  const UserState({
    required this.fullName,
    required this.email,
    required this.lstNotas,
  });

  UserState copyWith({
    String? fullName,
    String? email,
    Nota? nota,
  }) =>
      UserState(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        lstNotas: nota == null ? lstNotas : [...lstNotas, nota],
      );

  UserState removeNota(Nota nota) {
    lstNotas.remove(nota);
    return UserState(fullName: fullName, email: email, lstNotas: lstNotas);
  }

  @override
  List<Object> get props => [fullName, email, lstNotas];
}
