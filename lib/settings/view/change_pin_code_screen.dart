
import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/buttons.dart';
import 'package:upstanders/global/widgets/passcode.dart';
import 'package:upstanders/register/view/view.dart';
import 'package:upstanders/register/widgets/widgets.dart';
import 'package:upstanders/settings/view/create_pin_code_screen.dart';

class ChangePinCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: MyTheme.secondryColor,
      appBar: AppBar(
        backgroundColor: MyTheme.primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:  Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: MyTheme.secondryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Text(
                "CHANGE PIN",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
            ],
          )
        
      ),
      body: _ChangePinCodeForm(),
      
    );
  }
}

class _ChangePinCodeForm extends StatelessWidget {
  TextEditingController pin1Controller = TextEditingController();
  TextEditingController pin2Controller = TextEditingController();
  TextEditingController pin3Controller = TextEditingController();
  TextEditingController pin4Controller = TextEditingController();
  TextEditingController _codePutController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     final BoxDecoration pinPutDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0),
    );
    return Container(
      width: size.width,
      height: size.height,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              "Enter your current pin",
              style: TextStyle(
                  color: MyTheme.white,
                  fontSize: 20,
                  height: 2.000,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.04),
            _rowInputs(),
            


            
          
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: RoundedBorderTextButton(
                  fontSize: 18,
                  title: "NEXT",
                  height: size.height * 0.06,
                  width: size.width / 2.7,
                  bgColor: MyTheme.primaryColor,
                  textColor: MyTheme.secondryColor,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreatePinCodeScreen()));
                  },
                   borderColor: MyTheme.primaryColor, 
                  borderRadius: 80,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _rowInputs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // PinCodeTextEditField(
        //   controller: pin1Controller,
        // ),
        // // SizedBox(width:6),
        // PinCodeTextEditField(
        //   controller: pin2Controller,
        // ),
        // // SizedBox(width:6),
        // PinCodeTextEditField(
        //   controller: pin3Controller,
        // ),
        // // SizedBox(width:6),
        // PinCodeTextEditField(
        //       controller: pin4Controller,
        // ),
        // Expanded(child: Passcode()),
        Container(
          width: 200,
          child: Passcode()),

        InkWell(
          onTap: (){},
          child: Image.asset("assets/icons/eyes.png", height: 30, width: 30,),

        )
  
      ],
    );
  }
}
