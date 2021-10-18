import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/login/view/forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: MyTheme.secondryColor,
      appBar: AppBar(
        backgroundColor: MyTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text("FORGOT PASSWORD", style: TextStyle(
          color: MyTheme.secondryColor,
        ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: MyTheme.secondryColor,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ForgotPasswordForm(),
      
    );
  }
}