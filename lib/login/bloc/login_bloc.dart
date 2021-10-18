import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:upstanders/global/local/local_data_helper.dart';
import 'package:upstanders/login/repository/repository.dart';
import 'package:upstanders/login/validator/email_validator.dart';
import 'package:upstanders/login/validator/pin_validator.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
    // @required AuthenticationRepository authenticationRepository,
    )  : 
  // _authenticationRepository = authenticationRepository,
        super(const LoginState());

   Repository _repository = Repository();

LocalDataHelper localDataHelper = LocalDataHelper();
  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginEmailChanged) {
      yield _mapEmailChangedToState(event, state);
    } else if (event is LoginPinChanged) {
      yield _mapPinChangedToState(event, state);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    }
  }

  LoginState _mapEmailChangedToState(
    LoginEmailChanged event,
    LoginState state,
  ) {
    // final email = event.email;
    final email = Email.dirty(event.email);
    return state.copyWith(
      email: email,
      status:  Formz.validate([state.pin, email]),
      // Formz.validate([email, state.pin]),
    );
  }

  LoginState _mapPinChangedToState(
    LoginPinChanged event,
    LoginState state,
  ) {
    final pin =  Pin.dirty(event.pin);
    return state.copyWith(
      pin: pin,
      status: Formz.validate([pin, state.email]),
      // Formz.validate([email, state.email]),
    );
  }

  Stream<LoginState> _mapLoginSubmittedToState(
    LoginSubmitted event,
    LoginState state,
  ) async* {
    // if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      var res = await _repository.logIn(
          email: state.email.value,
          pin: state.pin.value
        );
      if(res['status'] ==200){
        localDataHelper.saveStringValue(key: "token",value: res['data']["token"]);
        yield state.copyWith(status: FormzStatus.submissionSuccess, res: res);

      }else{
        yield state.copyWith(status: FormzStatus.submissionFailure, res: res);

      }
      
    // }
  }
}



