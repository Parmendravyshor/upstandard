import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:upstanders/global/local/local_data_helper.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/buttons.dart';
import 'package:upstanders/global/widgets/dialogs.dart';

import 'package:upstanders/register/bloc/create_account_bloc.dart';
import 'package:upstanders/register/models/create_account.dart';

import 'package:upstanders/register/view/view.dart';
import 'package:upstanders/register/widgets/widgets.dart';



class VerifyAccountScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.secondryColor,
      appBar: AppBar(
        backgroundColor: MyTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text("VERIFY YOUR ACCOUNT", style: TextStyle(
          color: MyTheme.secondryColor,
        ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: MyTheme.secondryColor,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: _VerifyAccountFormScreen(),
    );
  }
}









class _VerifyAccountFormScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
     BlocProvider(
      create: (context) {
        return CreateAccountBloc();
          
      },
      child:
       BlocListener<CreateAccountBloc, CreateAccountState>(
          listener: (context, state) {
            if(state.registrationStatus == RegistrationStatus.verifiedOTP){
              Fluttertoast.showToast(
                  msg: "Otp verified successfully",
                 
              );
              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              //   builder: (context)=>MapViewScreen()), (route) => false);

              

            }else if(state.registrationStatus == RegistrationStatus.failure){
              print("${state.registrationStatus}");
              Fluttertoast.showToast(
                  msg: "${state.registrationStatus}",
                 
              );

            } 
            // else if(state.registrationStatus == RegistrationStatus.){
            //   print("${state.registrationStatus}");

            // }

            
           
          },
          child: _VerifyAccountForm(),
        // ) 
      
    ));
  }
}



class _VerifyAccountForm extends StatefulWidget {
  
  @override
  __VerifyAccountFormState createState() => __VerifyAccountFormState();
}

class __VerifyAccountFormState extends State<_VerifyAccountForm> {
  TextEditingController _pinPutController = TextEditingController();
  CreateAccount createAccount  = CreateAccount();
  LocalDataHelper localDataHelper = LocalDataHelper();

  
  @override
    void initState() {
      super.initState();
     _addToken();
    }
    _addToken()async{
      var token = await localDataHelper.getStringValue(key: "token");

      // createAccount.token = token;
    }

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
   final BoxDecoration pinPutDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0),
    );
    return Container(
       padding: const EdgeInsets.only(left:25, right: 25, top: 20),
      child: SingleChildScrollView(
         child: Column(
          children: [
             Text("Enter the confirmation code",
              style: TextStyle(
                color: MyTheme.white,
                fontSize: 16,
                height: 2.000, 
                fontWeight: FontWeight.bold),
              ),
            
              SizedBox(height: size.height * 0.06),
            
            PinPut(
              validator: (s) {
                if (s.contains('1')) return null;
                return 'NOT VALID';
              },
              useNativeKeyboard: true,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              withCursor: true,
              fieldsCount: 5,
              fieldsAlignment: MainAxisAlignment.spaceAround,
              textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
              eachFieldMargin: EdgeInsets.all(0),
              eachFieldWidth: 50.0,
              eachFieldHeight: 50.0,
              onSubmit: (String pin) {
                 createAccount.otp = pin;
                 localDataHelper.saveStringValue(key: "otp", value: pin);

              },
              autofocus: true,
              // focusNode: _pinPutFocusNode.,
              controller: _pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration.copyWith(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: MyTheme.primaryColor,
                ),
              ),
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.scale,
            ),
             SizedBox(height: size.height * 0.06),

             _VerifyMeButton(createAccount: createAccount,),
             SizedBox(height: size.height * 0.02),
            _resendCodeButton(size, context)

          ],
        ),
      ),
      
    );
  }

  _resendCodeButton(Size size, BuildContext context){
    return InkWell(
      onTap: (){
       
      },
      child: Container(
        alignment: Alignment.center,
        // height: siz,
        // width: size.width,
        
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(Icons.restore, color:  MyTheme.white,),
            Image.asset("assets/icons/sendAgain.png",
            height:30,width: 30,),

            SizedBox(width: 10),

            Text("SEND AGAIN",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: MyTheme.white),
            )
          ],
        )
      ),
    );
  }
}

class _VerifyMeButton extends StatelessWidget {
  
final CreateAccount createAccount;

  const _VerifyMeButton({Key key, this.createAccount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size  = MediaQuery.of(context).size;
    return
      BlocProvider(
      create: (context) {
        return CreateAccountBloc();
          
      },
      child: BlocListener<CreateAccountBloc, CreateAccountState>(
          listener: (context, state) {
            if(state.registrationStatus == RegistrationStatus.verifiedOTP){
              Fluttertoast.showToast(
                  msg: "Otp verified successfully",
                 
              );
              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              //   builder: (context)=>MapViewScreen()), (route) => false);

              

            }else if(state.registrationStatus == RegistrationStatus.failure){
              print("${state.registrationStatus}");
              Fluttertoast.showToast(
                  msg: "${state.registrationStatus}",
                 
              );

            } 
            // else if(state.registrationStatus == RegistrationStatus.){
            //   print("${state.registrationStatus}");

            // }

            
           
          },
          child: 
     BlocBuilder<CreateAccountBloc, CreateAccountState>(
      buildWhen: (previous, current) => previous.registrationStatus != current.registrationStatus,
      builder: (context, state) {
        return state.registrationStatus == RegistrationStatus.verifyingOTP
            ? _processing(size) 
            : _bottomButton(size, context, createAccount);
           
      },
    ))
    );
  }

  _processing(Size size){
    return Container(
      width: size.width,
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }


  _bottomButton(Size size, BuildContext context , CreateAccount createAccount) {
    return RoundedBorderTextButton(
      title: "VERIFY ME",
      height: size.height * 0.06,
      width: size.width,
      fontSize :18,
      bgColor: MyTheme.primaryColor,
      textColor: MyTheme.secondryColor,
      onTap:(){
        context.read<CreateAccountBloc>().add( VerifyOTP(createAccount));

        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        //  builder: (context)=>MapViewScreen()), (route) => false);
        
      }, 
      borderColor:  MyTheme.primaryColor,
        borderRadius: 80,
    );
  }
}












