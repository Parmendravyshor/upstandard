import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/buttons.dart';

class ForgotPasswordForm extends StatelessWidget {
    var _emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
       padding: const EdgeInsets.only(left:25, right: 25, top: 20),
      child: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text("Enter your email address",
              style: TextStyle(
                color: MyTheme.white,
                fontSize: 16,
                height: 2.000, 
                fontWeight: FontWeight.bold),
              ),
            
              SizedBox(height: size.height * 0.04),
              new TextFormField(
              keyboardType: TextInputType.emailAddress,
              
              controller: _emailController,
              decoration: new InputDecoration(
               filled: true,
               fillColor: MyTheme.white,
                  contentPadding: const EdgeInsets.all(8),
                  focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: MyTheme.primaryColor, ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                     width: 0,
                    color: MyTheme.secondryColor,),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                     width: 2,
                    color: MyTheme.red,),
                ),
                prefixIcon:   Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Image.asset(
                    "assets/icons/email.png",
                    width: 25.0,
                    height: 20,
                   
                  ),
                ),
              
                hintText: 'Email',
               hintStyle:  TextStyle(
                  fontSize: 12,
                  color: MyTheme.grey,
                  fontWeight: FontWeight.bold),
                
                  ),
              onSaved: (String value) {},
             
            ),

            
            
             SizedBox(height: size.height * 0.1),

             RoundedBorderTextButton(
               title: "SEND",
               height: size.height * 0.06,
               width: size.width,
               fontSize :18,
               bgColor: MyTheme.primaryColor,
               textColor: MyTheme.secondryColor,
               onTap: (){
                
               },
                borderColor:  MyTheme.primaryColor, 
                borderRadius: 80,
             ),
             SizedBox(height: size.height * 0.02),
            _resendAgainButton(size, context)

          ],
        ),
      ),
      
    );
  }

  _resendAgainButton(Size size, BuildContext context){
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
            height:28,width: 28,),

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