import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/nota.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(const UserState(
          email: '',
          fullName: '',
          contenido: '',
          lstNotas: [],
        )) {
    on<UserEmailEvent>((event, emit) => emit(
          state.copyWith(email: event.email),
        ));
    on<UserFullNameEvent>((event, emit) => emit(
          state.copyWith(fullName: event.fullName),
        ));
    on<UserAddNotaEvent>((event, emit) => emit(
          state.copyWith(nota: event.nota),
        ));
    on<UserDeleteNotaEvent>((event, emit) => emit(
          state.removeNota(event.nota),
        ));
    on<UserContenidoEvent>((event, emit) => emit(
          state.copyWith(contenido: event.value),
        ));
    on<UserClearNotasEvent>((event, emit) => emit(
          state.clearNota(),
        ));
  }
}
