import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:upstanders/global/theme/colors.dart';

class Passcode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      onCompleted: (_value) {
        print("values entered $_value");
        // value = _value;
      },
      autoFocus:true ,
      inactiveColor: MyTheme.secondryColor,
      shape:  PinCodeFieldShape.underline,
      activeFillColor: Colors.white,
      backgroundColor: MyTheme.secondryColor,
      activeColor: MyTheme.secondryColor,
      selectedFillColor: Colors.white,
      textInputType: TextInputType.phone,
      length: 4,
      obsecureText: true,
      

      textStyle:
          TextStyle(color: Colors.white, fontSize: 30),
      animationType: AnimationType.scale,
      //shape: PinCodeFieldShape.box,
      animationDuration: Duration(milliseconds: 300),
      //borderRadius: BorderRadius.circular(5),
      fieldHeight: 50,
      fieldWidth: 50,
      onChanged: (String value) {},
    );
  }
}