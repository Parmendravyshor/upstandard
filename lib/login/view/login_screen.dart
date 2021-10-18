
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upstanders/global/theme/colors.dart';

import 'package:upstanders/login/bloc/login_bloc.dart';
import 'package:upstanders/login/view/view.dart';
import 'package:formz/formz.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
   // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.secondryColor,
      body: Column(
        children: [
          //SizedBox(height: size.height * 0.1),
          _LoginLogo(),
          _LoginFormScreen()
        ],
      ),
    );
  }
}

class _LoginLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
     height: size.height * 100,
     width: size.width * 100,
      decoration: BoxDecoration(
         color: MyTheme.primaryColor,
          borderRadius: BorderRadius.circular(20),
         border: Border.all(color: Colors.black),
          image: DecorationImage(image: AssetImage("assets/images/X - 9.png"))),
    );
  }
}


class _LoginFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return LoginBloc(
              // authenticationRepository:
              //     RepositoryProvider.of<AuthenticationRepository>(context),
              );
        },
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.status.isSubmissionSuccess) {
              Fluttertoast.showToast(
                msg: "${state.res['message']}",//User loggedIn Successfully
              );
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (context) => MapViewScreen()),
              //     (route) => false);
            }
            if (state.status.isSubmissionFailure) {
              Fluttertoast.showToast(
                msg: "${state.res['message']}",
              );
              // Fluttertoast.showToast(
              //   msg: "Something went wrong",
              // );
            }
          },
          child: InputForm(),
        ));
  }
}
