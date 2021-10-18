
import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/buttons.dart';
import 'package:upstanders/global/widgets/dialogs.dart';
import 'package:upstanders/global/widgets/passcode.dart';



import 'package:upstanders/register/widgets/widgets.dart';


class ConfirmPinCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: MyTheme.secondryColor,
      appBar: AppBar(
        backgroundColor: MyTheme.primaryColor,
        automaticallyImplyLeading: false,
        
        title: 
        Row(
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
                "CONFIRM PIN",
                style: TextStyle(
                    // fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
            ],
          )
      ),
      body: _ConfirmPinCodeForm(),
      
    );
  }
}

class _ConfirmPinCodeForm extends StatelessWidget {
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
              "Confirm pin",
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
                  title: "CONFIRM",
                  height: size.height * 0.06,
                  width: size.width / 2.7,
                  bgColor: MyTheme.primaryColor,
                  textColor: MyTheme.secondryColor,
                  onTap: () {
                   showGeneralDialog(
                      barrierLabel: "Barrier",
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: Duration(milliseconds: 700),
                      context: context,
                      pageBuilder: (_, __, ___) {
                        return Align(
                            alignment: Alignment.center,
                            child:
                          CongratulationDialogBox(
                            onContinue: (){
                              Navigator.of(context).pop();
                               Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                 Navigator.of(context).pop();
                              //  Navigator.of(context).pushAndRemoveUntil(
                              //   MaterialPageRoute(builder: (context)=>MapViewScreen()),
                              //   (route) => false);
                            },
                          )
                            

                        );
                      },
                      transitionBuilder: (_, anim, __, child) {
                        return SlideTransition(
                          position:
                              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
                          child: child,
                        );
                      },
                    );


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
