import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upstanders/global/theme/colors.dart';

import 'package:upstanders/login/bloc/login_bloc.dart';
import 'package:upstanders/login/view/forgot_password_screen.dart';
import 'package:upstanders/register/view/create_account_screen.dart';
import 'package:formz/formz.dart';


class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  var _formKey = new GlobalKey<FormState>();

  var _emailController = new TextEditingController();

  var _pinController = TextEditingController();

  var _autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "GET STARTED",
                      style: TextStyle(
                          color: MyTheme.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  bottomField(size),
                ],
              ),
            ),
          )),
    );
  }

  Widget bottomField(Size size) {
    return Container(
      decoration: BoxDecoration(
          color: MyTheme.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight:  Radius.circular(30),
          )),
      child: new Form(
          key: _formKey,
          autovalidateMode: _autoValidateMode,
          child: new Column(
            children: <Widget>[
              _inputsFields(),
              _loginButtonForm()
            ],
          )),
    );
  }

  _inputsFields() {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "LOGIN",
            style: TextStyle(
                color: MyTheme.secondryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          _EmailForm(),
          new SizedBox(
            height: 20.0,
          ),
          _PinInput(),

          new SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreateAccountScreen()));
                },
                child: Text(
                  "Create New Account",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.primaryColor),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen()));
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.secondryColor),
                ),
              ),
            ],
          ),
          new SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  _loginButtonForm(){
    return new Container(
      alignment: Alignment.center,
      child: _LoginButton()

    );
  }

}


class _EmailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          key: const Key('loginForm_EmailInput_textField'),
            keyboardType: TextInputType.emailAddress,
            // controller: _emailController,
            decoration: new InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: MyTheme.primaryColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: MyTheme.grey,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: MyTheme.red,
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Image.asset(
                  "assets/icons/email.png",
                  width: 25.0,
                  height: 20,
                ),
              ),
              hintText: 'Email',
              errorText: state.email.invalid ? 'Invalid email' : null,
              hintStyle: TextStyle(
                  fontSize: 12,
                  color: MyTheme.grey,
                  fontWeight: FontWeight.bold),
            ),
            onChanged: (email) =>
              context.read<LoginBloc>().add(LoginEmailChanged(email)),
          );

        // TextField(
        //   key: const Key('loginForm_usernameInput_textField'),
        //   onChanged: (email) =>
        //       context.read<LoginBloc>().add(LoginUsernameChanged(email)),
        //   decoration: InputDecoration(
        //     labelText: 'username',
        //     errorText: state.username.invalid ? 'invalid email' : null,
        //   ),
        // );
      },
    );
  }
}





class _PinInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.pin != current.pin,
      builder: (context, state) {
        return TextFormField(
            // controller: _pinController,
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: MyTheme.primaryColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: MyTheme.grey,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: MyTheme.red,
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  "assets/icons/pin.png",
                  width: 25.0,
                  height: 20,
                  // color: Colors.grey[600],
                ),
              ),
              hintText: 'Pin',
              errorText: state.pin.invalid ? 'Invalid Pin' : null,
              hintStyle: TextStyle(
                  fontSize: 12,
                  color: MyTheme.grey,
                  fontWeight: FontWeight.bold),
            ),
            onSaved: (String value) {},
            keyboardType: TextInputType.number,
              onChanged: (pin) =>
              context.read<LoginBloc>().add(LoginPinChanged(pin)),
          );

      },
    );
  }
}




class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : InkWell(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => MapViewScreen()));
                context.read<LoginBloc>().add(const LoginSubmitted());


              },
              child: Container(
                height: size.height * 0.08,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: MyTheme.primaryColor,
                ),
                child: Text(
                  "LOGIN",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
              ),
            );
            // ElevatedButton(
            //     key: const Key('loginForm_continue_raisedButton'),
            //     child: const Text('Login'),
            //     onPressed: state.status.isValidated
            //         ? () {
            //             context.read<LoginBloc>().add(const LoginSubmitted());
            //           }
            //         : null,
            //   );
      },
    );
  }
}
