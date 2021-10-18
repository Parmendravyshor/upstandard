import 'dart:async';

// import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';

import 'package:upstanders/api/apis.dart';
// import 'package:upstanders/register/bloc/create_account_bloc.dart';
import 'package:upstanders/register/models/create_account.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, signedUp }

class Repository {
  final _controller = StreamController<AuthenticationStatus>();
  Apis _apis = Apis();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<dynamic> logIn({
    @required String email,
    @required String pin,
  }) async {
   var res = await _apis.login(email: email, pin: pin);
   return res;
    // _controller.add(AuthenticationStatus.authenticated);


    // await Future.delayed(
    //   const Duration(milliseconds: 300),
    //   () => _controller.add(AuthenticationStatus.authenticated),
    // );
  }


  
  Future<dynamic> signup({
    @required String email,
    @required String pin,
  }) async {
    var res = await _apis.signup(email: email, pin: pin);
    print("signuppppppp response :$res");
    return res;

    // _controller.add(AuthenticationStatus.signedUp);


    // await Future.delayed(
    //   const Duration(milliseconds: 300),
    //   () => _controller.add(AuthenticationStatus.authenticated),
    // );
  }

  Future<dynamic> sendOTP({CreateAccount createAccount}) async {
   var res =  await _apis.sendOTP( );//createAccount: createAccount,
    return res;
  }


  Future<dynamic> verifyOTP({
    @required CreateAccount createAccount,
   
  }) async {
    var res = _apis.verifyOTP(createAccount: createAccount, );
    return res;
    
    
  }

  Future<dynamic> createAccount({
    @required CreateAccount createAccount
   
  }) async {
    var res = _apis.createAccount(createAccount: createAccount);
    return res;
    
  }


  Future<dynamic> uploadImage({
    @required String file
   
  }) async {
    var res = _apis.upload(file: file);
    return res;
    
  }


  

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}


