import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:formz/formz.dart';
import 'package:upstanders/global/local/local_data_helper.dart';
import 'package:upstanders/login/repository/repository.dart';
import 'package:upstanders/login/validator/email_validator.dart';
import 'package:upstanders/login/validator/pin_confirm_validator.dart';
import 'package:upstanders/login/validator/pin_validator.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
   SignUpBloc(
    // @required AuthenticationRepository authenticationRepository,
    )  : 
  // _authenticationRepository = authenticationRepository,
        super(const SignUpState());
 

  Repository _repository = Repository();

  // SignUpBloc(SignUpState initialState) : super(initialState);
 LocalDataHelper localDataHelper = LocalDataHelper();

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is SignUpEmailChanged) {
      yield _mapEmailChangedToState(event, state);
    } else if (event is SignUpPinChanged) {
      yield _mapPinChangedToState(event, state);
    } else if (event is SignUpPinConfirmChanged) {
      yield _mapPinConfirmChangedToState(event, state);
    } else if (event is SignUpSubmitted) {
      yield* _mapSignUpSubmittedToState(event, state);
    }
  }

  SignUpState _mapEmailChangedToState(
    SignUpEmailChanged event,
    SignUpState state,
  ) {
    // final email = event.email;
    final email = Email.dirty(event.email);
    return state.copyWith(
      email: email,
      status:  Formz.validate([state.pin, email]),
      
    );
  }

  SignUpState _mapPinChangedToState(
    SignUpPinChanged event,
    SignUpState state,
  ) {
    final pin =  Pin.dirty(event.pin);
    return state.copyWith(
      pin: pin,
      status: Formz.validate([pin, state.email]),
      // Formz.validate([email, state.email]),
    );
  }

  SignUpState _mapPinConfirmChangedToState(
    SignUpPinConfirmChanged event,
    SignUpState state,
  ) {
    print("state.pin.value state.pin.value state.pin.value:${state.pin.value}");
    
    final confirmedPin =  ConfirmedPin.dirty(pin:  state.pin.value,value:event.confirmPin);
    return state.copyWith(
      confirmedPin: confirmedPin,
      status: Formz.validate([confirmedPin, state.email]),
      // Formz.validate([email, state.email]),
    );
  }

  Stream<SignUpState> _mapSignUpSubmittedToState(
    SignUpSubmitted event,
    SignUpState state,
  ) async* {
    // if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      //  
      var res = await _repository.signup(
          email: state.email.value,
          pin: state.pin.value
        );
      if(res['status'] ==200){
        print("res['data']token  :${res['data']["token"]}");
        localDataHelper.saveStringValue(key: "token",value: res['data']["token"]);
        yield state.copyWith(status: FormzStatus.submissionSuccess,res: res);

      }else{
        yield state.copyWith(status: FormzStatus.submissionFailure, res: res);

      }

     
    // }
  }
}

