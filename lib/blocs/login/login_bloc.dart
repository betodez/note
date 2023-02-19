import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(const LoginState(
          email: '',
          password: '',
          errEmail: '',
          errMsg: '',
          msgPassword: '',
        )) {
    on<LoginEmailEvent>((event, emit) => emit(
          state.copyWith(email: event.email),
        ));
    on<LoginPasswordEvent>((event, emit) => emit(
          state.copyWith(password: event.password),
        ));
    on<LoginErrorEmailEvent>((event, emit) => emit(
          state.copyWith(errEmail: event.errEmail),
        ));
    on<LoginMsgEvent>((event, emit) => emit(
          state.copyWith(errMsg: event.msg),
        ));
    on<LoginMsgPasswordEvent>((event, emit) => emit(
          state.copyWith(msgPassword: event.msg),
        ));
  }
}
