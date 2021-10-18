import 'dart:async';
import 'dart:convert';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:formz/formz.dart';
import 'package:upstanders/login/repository/repository.dart';
import 'package:upstanders/login/validator/email_validator.dart';
import 'package:upstanders/login/validator/pin_confirm_validator.dart';
import 'package:upstanders/login/validator/pin_validator.dart';
import 'package:upstanders/register/models/create_account.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
   CreateAccountBloc(
    // @required AuthenticationRepository authenticationRepository,
    )  : 
  // _authenticationRepository = authenticationRepository,
        super(const CreateAccountState());
 

 Repository _repository = Repository();
 CreateAccount createAccount  = CreateAccount();

  // CreateAccountBloc(CreateAccountState initialState) : super(initialState);

  @override
  Stream<CreateAccountState> mapEventToState(
    CreateAccountEvent event,
  ) async* {
    if (event is SendOTP) {
      yield* _mapSendOTPToState(event, state);
    } else if (event is VerifyOTP) {
      yield* _mapVerifyOTPToState(event, state);
    } 
    else if (event is UpdateUser) {
      yield* _mapCreateAccountToState(event, state);
    }
    else if (event is UploadImage) {
      yield* _mapUploadImageToState(event, state);
    }
  }

  Stream<CreateAccountState> _mapSendOTPToState(
    SendOTP event,
    CreateAccountState state,
  ) async*{

  
     yield state.copyWith(registrationStatus: RegistrationStatus.processing);//sendingOTP
    var res =  await _repository.sendOTP(
          createAccount :state.createAccount
        );
        if(res['status'] == 200){
          yield state.copyWith(registrationStatus: RegistrationStatus.sentOTP, data: res);

        }else{
          yield state.copyWith(registrationStatus: RegistrationStatus.failure, data: res );
          print ('error');
        }
      //   try {
      //   await _authenticationRepository.sendOTP(
      //    createAccount :state.createAccount
      //   );
      //   yield state.copyWith(registrationStatus: RegistrationStatus.sentOTP);
      // } on Exception catch (_) {
      //   yield state.copyWith(registrationStatus: RegistrationStatus.failure );
      // }

     
    
     
  }



Stream<CreateAccountState> _mapVerifyOTPToState(
    VerifyOTP event,
    CreateAccountState state,
  ) async*{

  
     yield state.copyWith(registrationStatus: RegistrationStatus.verifyingOTP);
      var res =  await _repository.verifyOTP(
         createAccount :event.createAccount
        );
        if(res['status'] == 200){
          yield state.copyWith(registrationStatus: RegistrationStatus.verifiedOTP, data: res);

        }else{
          yield state.copyWith(registrationStatus: RegistrationStatus.failure, data: res );
        }
      // try {
      //   var res =  await _repository.verifyOTP(
      //    createAccount :state.createAccount
      //   );
      //   yield state.copyWith(registrationStatus: RegistrationStatus.verifiedOTP);
      // } on Exception catch (_) {
      //   yield state.copyWith(registrationStatus: RegistrationStatus.failure );
      // }
    
     
  }

  Stream<CreateAccountState> _mapCreateAccountToState(
    UpdateUser event,
    CreateAccountState state,
  ) async*{

  
     yield state.copyWith(registrationStatus: RegistrationStatus.processing);
      var res =  await _repository.createAccount(
         createAccount :createAccount
        //  event.createAccount
        );
        if(res['status'] == 200){
          yield state.copyWith(registrationStatus: RegistrationStatus.done, data: res);

        }else{
          yield state.copyWith(registrationStatus: RegistrationStatus.failure, data: res );
        }
     
  }

  Stream<CreateAccountState> _mapUploadImageToState(
    UploadImage event,
    CreateAccountState state,
  ) async*{

  
     yield state.copyWith(registrationStatus: RegistrationStatus.uploadingImage);
      var res =  await _repository.uploadImage(
         file :event.file,
        
        );
         if(res['status'] == 200){
          yield state.copyWith(registrationStatus: RegistrationStatus.uploadedImage, data:res['data']);

        }else{
          yield state.copyWith(registrationStatus: RegistrationStatus.failure ,data: res);
        }
        
     
  }
}

 



