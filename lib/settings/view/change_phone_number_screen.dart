import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/buttons.dart';

import 'package:upstanders/register/view/view.dart';
import 'package:upstanders/settings/view/verify_screen_screen2.dart';

class ChangePhoneNumberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.secondryColor,
       appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
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
                "CHANGE PHONE NUMBER",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
            ],
          )),


     body: ChangePhoneNumberForm(),
     
      
    );
  }
}




class ChangePhoneNumberForm extends StatelessWidget {
    var _oldNumberController = new TextEditingController();
     var _newNumberController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
       padding: const EdgeInsets.only(left:25, right: 25, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       children: [
          Text("Old Phone Number",
           style: TextStyle(
             color: MyTheme.white,
             fontSize: 16,
             height: 2.000, 
             fontWeight: FontWeight.bold),
           ),
         
           SizedBox(height: size.height * 0.01),
           new TextFormField(
           keyboardType: TextInputType.phone,
           
           controller: _oldNumberController,
           decoration: new InputDecoration(
            filled: true,
            fillColor: MyTheme.primaryColor,
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
                 "assets/icons/changeNumber.png",
                 width: 25.0,
                 height: 20,
                
               ),
             ),
           
             hintText: 'Phone',
            hintStyle:  TextStyle(
               fontSize: 12,
               color: MyTheme.grey,
               fontWeight: FontWeight.bold),
             
               ),
           onSaved: (String value) {
            
           },
          
         ),

         Text("New Phone Number",
           style: TextStyle(
             color: MyTheme.white,
             fontSize: 16,
             height: 2.000, 
             fontWeight: FontWeight.bold),
           ),
         
           SizedBox(height: size.height * 0.01),
           new TextFormField(
           keyboardType: TextInputType.phone,
           
           controller: _newNumberController,
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
                 "assets/icons/phone.png",
                 width: 25.0,
                 height: 20,
                
               ),
             ),
           
             hintText: 'Phone',
            hintStyle:  TextStyle(
               fontSize: 12,
               color: MyTheme.grey,
               fontWeight: FontWeight.bold),
             
               ),
           onSaved: (String value) {},
          
         ),


         
         
          SizedBox(height: size.height * 0.1),

          
         Expanded(
          child: Align(
             alignment: Alignment.bottomCenter,
             child: RoundedBorderTextButton(
              title: "SAVE",
              height: size.height * 0.06,
              width: size.width,
              fontSize :18,
              bgColor: MyTheme.primaryColor,
              textColor: MyTheme.secondryColor,
              onTap: (){
                 Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => VerifyAccountScreen2()));
               
               
              },
               borderColor:  MyTheme.primaryColor, 
               borderRadius: 80,
            ),
           ),
         ),
          SizedBox(height: size.height * 0.03),

       ],
     ),
      
    );
  }
  
   

  

}