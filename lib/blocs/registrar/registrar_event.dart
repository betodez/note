part of 'registrar_bloc.dart';

abstract class RegistrarEvent extends Equatable {
  const RegistrarEvent();

  @override
  List<Object> get props => [];
}

class ErrorRegistrarPasswordRepeatEvent extends RegistrarEvent {
  final String error;

  const ErrorRegistrarPasswordRepeatEvent(this.error);
}

class ValidoRegistrarPasswordRepeatEvent extends RegistrarEvent {
  const ValidoRegistrarPasswordRepeatEvent();
}

class ErrorRegistrarEmailEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarEmailEvent(this.error);
}

class ValidoRegistrarEmailEvent extends RegistrarEvent {
  const ValidoRegistrarEmailEvent();
}

class ErrorRegistrarNameEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarNameEvent(this.error);
}

class ErrorRegistrarNameEmptyEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarNameEmptyEvent(this.error);
}

class ValidoRegistrarNameEvent extends RegistrarEvent {
  const ValidoRegistrarNameEvent();
}

class ErrorRegistrarPasswordEvent extends RegistrarEvent {
  final String error;

  const ErrorRegistrarPasswordEvent(this.error);
}

class ErrorRegistrarPasswordShortEvent extends RegistrarEvent {
  final String error;
  const ErrorRegistrarPasswordShortEvent(this.error);
}

class ValidoRegistrarPasswordEvent extends RegistrarEvent {
  const ValidoRegistrarPasswordEvent();
}

class RegistrarMessageEvent extends RegistrarEvent {
  final String message;
  const RegistrarMessageEvent(this.message);
}

class RegistrarFullNameEvent extends RegistrarEvent {
  final String value;
  const RegistrarFullNameEvent(this.value);
}

class RegistrarEmailEvent extends RegistrarEvent {
  final String value;
  const RegistrarEmailEvent(this.value);
}

class RegistrarPasswordEvent extends RegistrarEvent {
  final String value;
  const RegistrarPasswordEvent(this.value);
}

class RegistrarRepeatPasswordEvent extends RegistrarEvent {
  final String value;
  const RegistrarRepeatPasswordEvent(this.value);
}
