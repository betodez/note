import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:note_app/models/user.dart';

part 'registrar_event.dart';
part 'registrar_state.dart';

class RegistrarBloc extends Bloc<RegistrarEvent, RegistrarState> {
  RegistrarBloc()
      : super(RegistrarSetState(
            errorEmail: '',
            errorFullName: '',
            errorPassword: '',
            user: User(fullName: '', email: '', password: '')));
}
