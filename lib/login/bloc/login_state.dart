part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    // this.email ,
    // this.pin
     this.email = const Email.pure(),
    this.pin = const Pin.pure(),
     this.res
  });

  final FormzStatus status;
  // final String email;
  // final String pin;
  final Pin pin;
  final Email email;
  final Map res;

  LoginState copyWith({
    FormzStatus status,
    Email email,
    Pin pin,
    Map res,
    // String email,
    // String pin,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      pin: pin ?? this.pin,
      res: res??this.res
    );
  }

  @override
  List<Object> get props => [status, email, pin, res];
}
