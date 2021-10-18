import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/buttons.dart';
import 'package:upstanders/global/widgets/profile_avatar.dart';
import 'package:upstanders/settings/view/change_phone_number_screen.dart';
import 'package:upstanders/settings/view/change_pin_code_screen.dart';

class AccountProfileScreen extends StatelessWidget {
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
                "ACCOUNT & PROFILE",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
            ],
          )),


     body: _AccountProfileForm(),
     
      
    );
  }
}
class _AccountProfileForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
        double avatarRadius = size .height * 0.16;
    return Container(
       padding: const EdgeInsets.only(left:25, right: 25, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Container(
           width: size.width,
            alignment: Alignment.center,
            child: 
               Container(
                  height: size.height *0.16 ,
                  width: size.width * 0.4,
                  // color: MyTheme.red,
                  child: Stack(
                    children: [
                      ProfileAvatar(
                        avatarRadius: avatarRadius, 
                        width: avatarRadius + 30 ,
                        imageUrl: "assets/users/CrystalGaskell.png"
                        // 'https://wallpaperaccess.com/full/3957694.jpg',

                      ),
                       Positioned(
                         bottom: 0,
                         right: 10,
                        // alignment: Alignment.bottomRight,
                        child: Image.asset("assets/icons/camera.png",
                        height: 30, width: 30,))
                    ],
                  ),
               ),
             
         ),
        SizedBox(height: size.height * 0.01),
        Text("CHANGE NUMBER",
           style: TextStyle(
             color: MyTheme.white,
             fontSize: 16,
             height: 2.000, 
             fontWeight: FontWeight.bold),
           ),
         
           SizedBox(height: size.height * 0.01),
           Container(
             padding: const EdgeInsets.only(left:8.0, right: 8, ),
             height: size.height * 0.068,
             width: size.width,
             alignment: Alignment.center,
             decoration: BoxDecoration(
               color: MyTheme.primaryColor,
               borderRadius: BorderRadius.circular(5)
             ),
             
             child: InkWell(
               onTap: (){
                 Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ChangePhoneNumberScreen()));
               },
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                    new Image.asset(
                      "assets/icons/changeNumber.png",
                      width: 30.0,
                      height: 30,
                      
                    ),
                    SizedBox(width: size.width * 0.04),
                     Padding(
                       padding:const EdgeInsets.only(bottom: 8 ),
                       child: Text("+91 8787673637",
                       textAlign: TextAlign.center,
                        style: TextStyle(
                          
                         
                          fontSize: 16,
                          height: 2.000, 
                          fontWeight: FontWeight.bold),
                        ),
                     ),


                 ],
               ),
             ),
           ),


         Text("PIN",
           style: TextStyle(
             color: MyTheme.white,
             fontSize: 16,
             height: 2.000, 
             fontWeight: FontWeight.bold),
           ),
          
         
           SizedBox(height: size.height * 0.01),
           new Container(
             padding: const EdgeInsets.only(left:8.0, right: 8, ),
             height: size.height * 0.068,
             width: size.width,
             decoration: BoxDecoration(
               color: MyTheme.primaryColor,
               borderRadius: BorderRadius.circular(5)
             ),
             
             child: InkWell(
               onTap: (){
                  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ChangePinCodeScreen()));
               },
               child: Row(
                 children: [
                    new Image.asset(
                      "assets/icons/pinChange.png",
                      width: 30.0,
                      height: 30,
                      
                    ),
                    SizedBox(width: size.width * 0.04),
                     Padding(
                       padding:const EdgeInsets.only(bottom: 8 ),
                       child: Text("CHANGE PIN",
                       textAlign: TextAlign.start,
                        style: TextStyle(
                          
                         
                          fontSize: 16,
                          height: 2.000, 
                          fontWeight: FontWeight.bold),
                        ),
                     ),


                 ],
               ),
             ),
           ),


         
         
          SizedBox(height: size.height * 0.1),

          
         Expanded(
          child: Align(
             alignment: Alignment.bottomCenter,
             child: 
             RoundedBorderTextIconButton(
              title: "CLOSE ACCOUNT",
              height: size.height * 0.06,
              width: size.width * 0.7,
              fontSize :18,
              bgColor: MyTheme.primaryColor,
              textColor: MyTheme.secondryColor,
              onTap: (){
               
              },
               borderColor:  MyTheme.primaryColor, 
               borderRadius: 80, 
               iconAsset: 'assets/icons/delete.png', iconColor: MyTheme.red,
            ),

            // RoundedBorderTextButton(
            //   title: "CLOSE ACCOUNT",
            //   height: size.height * 0.06,
            //   width: size.width * 0.7,
            //   fontSize :18,
            //   bgColor: MyTheme.primaryColor,
            //   textColor: MyTheme.secondryColor,
            //   onTap: (){
               
            //   },
            //    borderColor:  MyTheme.primaryColor, 
            //    borderRadius: 80,
            // ),
           ),
         ),
          SizedBox(height: size.height * 0.03),

       ],
        ),
      
    );
  }


}