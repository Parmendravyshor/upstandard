import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/register/bloc/signup_bloc.dart';
import 'package:formz/formz.dart';
import 'package:upstanders/register/view/view.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.secondryColor,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.1),
          _SignUpLogo(),
          _SignUpFormScreen()
        ],
      ),
    );
  }
}

class _SignUpLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: size.height * 0.2,
      width: size.width * 0.4,
      decoration: BoxDecoration(
          color: MyTheme.primaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black),
          image: DecorationImage(image: AssetImage("assets/images/logo.png"))),
    );
  }
}

class _SignUpFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return SignUpBloc();
        },
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state.status.isSubmissionSuccess) {
              // Fluttertoast.showToast(
              //   msg: "Account created successfully.",
              // );
               Fluttertoast.showToast(
                msg: "${state.res['message']}",//Otp has been sent over your mobile number .
              );
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CreateProfileScreen()),
              );
            } else if (state.status.isSubmissionFailure) {
              print("${state.status}");
              // Fluttertoast.showToast(
              //   msg: "${state.status}",
              // );
               Fluttertoast.showToast(
                msg: "${state.res['message']}",//Otp has been sent over your mobile number .
              );
            }
          },
          child: CreateAccountInputForm(),
        ));
  }
}

class CreateAccountInputForm extends StatefulWidget {
  @override
  _CreateAccountInputFormState createState() => _CreateAccountInputFormState();
}

class _CreateAccountInputFormState extends State<CreateAccountInputForm> {
  var _formKey = new GlobalKey<FormState>();

  var _emailController = new TextEditingController();

  var _pinController = TextEditingController();
  var _confirmPinController = TextEditingController();

  var _autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  bottomField(size),
                ],
              ),
            ),
          )),
    );
  }

  Widget bottomField(Size size) {
    return Container(
      alignment: FractionalOffset.bottomCenter,
      decoration: BoxDecoration(
          color: MyTheme.white, borderRadius: BorderRadius.circular(30)),
      child: new Form(
          key: _formKey,
          autovalidateMode: _autoValidateMode,
          child: new Column(
            children: <Widget>[_inputsFields(), _signupButton()],
          )),
    );
  }

  _signupButton() {
    final size = MediaQuery.of(context).size;
    return new Container(alignment: Alignment.center, child: _SignUpBotton()
        // _createButton(size),
        );
  }

  _inputsFields() {
    return Container(
      alignment: FractionalOffset.bottomCenter,
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "CREATE ACCOUNT",
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
            height: 20.0,
          ),
          _PinConfirmInput(),
          new SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.secondryColor),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.primaryColor),
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
}

class _EmailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          key: const Key('EmailForm_EmailInput_textField'),
          keyboardType: TextInputType.emailAddress,
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
            errorBorder: state.email.invalid
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: MyTheme.red,
                    ),
                  )
                : OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: MyTheme.grey,
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
                fontSize: 12, color: MyTheme.grey, fontWeight: FontWeight.bold),
          ),
          onChanged: (email) =>
              context.read<SignUpBloc>().add(SignUpEmailChanged(email)),
        );
      },
    );
  }
}

class _PinInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
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
            errorText: state.pin.invalid ? 'invalid password' : null,
            hintStyle: TextStyle(
                fontSize: 12, color: MyTheme.grey, fontWeight: FontWeight.bold),
          ),
          onSaved: (String value) {},
          keyboardType: TextInputType.number,
          onChanged: (pin) =>
              context.read<SignUpBloc>().add(SignUpPinChanged(pin)),
        );
      },
    );
  }
}

class _PinConfirmInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) =>
          previous.confirmedPin != current.confirmedPin,
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
            hintText: 'Confirm Pin',
            errorText: state.confirmedPin.invalid ? 'invalid Pin' : null,
            hintStyle: TextStyle(
                fontSize: 12, color: MyTheme.grey, fontWeight: FontWeight.bold),
          ),

          keyboardType: TextInputType.number,
          onChanged: (confirmedPin) => context
              .read<SignUpBloc>()
              .add(SignUpPinConfirmChanged(confirmedPin)),
        );
      },
    );
  }
}

class _SignUpBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : InkWell(
                onTap: () {
                  context.read<SignUpBloc>().add(const SignUpSubmitted());
                },
                child: Container(
                  height: size.height * 0.08,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: MyTheme.primaryColor,
                  ),
                  child: Text(
                    "CREATE",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17.0),
                  ),
                ),
              );
      },
    );
  }
}
