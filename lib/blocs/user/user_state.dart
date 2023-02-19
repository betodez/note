part of 'user_bloc.dart';

class UserState extends Equatable {
  final String fullName;
  final String email;
  final String contenido;
  final List<Nota> lstNotas;

  const UserState({
    required this.fullName,
    required this.email,
    required this.contenido,
    required this.lstNotas,
  });

  UserState copyWith({
    String? fullName,
    String? email,
    String? contenido,
    Nota? nota,
  }) =>
      UserState(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        contenido: contenido ?? this.contenido,
        lstNotas: nota == null ? lstNotas : [...lstNotas, nota],
      );

  UserState removeNota(Nota nota) {
    lstNotas.remove(nota);
    return UserState(
        contenido: contenido,
        fullName: fullName,
        email: email,
        lstNotas: lstNotas);
  }

  @override
  List<Object> get props => [fullName, email, lstNotas, contenido];
}
