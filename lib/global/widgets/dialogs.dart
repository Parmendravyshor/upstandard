import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/global/widgets/buttons.dart';
import 'package:upstanders/global/widgets/user_avatar.dart';



////// Register Success Dialog Box//////
class RegisterSuccessDialogBox extends StatelessWidget {
   final void Function() onContinue;
    final void Function() onCancel;

  const RegisterSuccessDialogBox({Key key, this.onContinue , this.onCancel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      margin: EdgeInsets.only(left: 12, right: 12),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        child:  RegisterSuccessBody(
          onContinue: onContinue,
          onCancel: onCancel,

        ),
      ));
  }
}

class RegisterSuccessBody extends StatelessWidget {
   final void Function() onContinue;
    final void Function() onCancel;
   

  const RegisterSuccessBody({Key key, this.onContinue , this.onCancel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/logo.png",
              height: size.height * 0.1,
              width: size.width * 0.2,
              fit: BoxFit.cover,
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "We verify IDs for everyone's safety",  
               textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                height: 1.2,
                  fontWeight: FontWeight.bold, color: MyTheme.secondryColor),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "New users won't be able to call for\nhelp or go on active duty until\ntheir id is verified.",  
               textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                height: 1.2,
                  fontWeight: FontWeight.bold, color: MyTheme.secondryColor),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              "If you have been reported for\ninappropriate behavior, you might\nnot be able to re-register, sorry..",  
               textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                height: 1.2,
                  fontWeight: FontWeight.bold, color: MyTheme.secondryColor),
            ),
            SizedBox(height: size.height * 0.04),
            
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: onCancel,
                  child: Text("CANCEL", style: TextStyle(
                    fontSize: 20,
                    color: MyTheme.black,
                    fontWeight: FontWeight.bold
                  ),)),
                SizedBox(width:30),
                RoundedBorderTextButton(
                  textColor: MyTheme.secondryColor,
                  title: "CONTINUE",
                  fontSize: 20,
                  bgColor: MyTheme.primaryColor,
                  height: size.height * 0.055,
                  width: size.width * 0.4,
                  onTap: onContinue,
                   borderColor: MyTheme.primaryColor,
                    borderRadius: 80,
                )
              ],
            )

          ],
        ));
  }
}

//////// Active Inactive Dialog Box ////////////

class ActiveInactiveDialogBox extends StatelessWidget {
   final void Function() onContinue;
    final void Function() onCancel;

  const ActiveInactiveDialogBox({Key key, this.onContinue , this.onCancel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
    height: size.height * 0.45,
    margin: EdgeInsets.only(left: 12, right: 12),
    padding: const EdgeInsets.all(0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Material(
      borderRadius: BorderRadius.circular(20),
      child:  ActiveInactiveBody(
        onContinue: onContinue,
        onCancel: onCancel,

      ),
    ));
  }
}

class ActiveInactiveBody extends StatelessWidget {
   final void Function() onContinue;
    final void Function() onCancel;
   

  const ActiveInactiveBody({Key key, this.onContinue , this.onCancel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/logo.png",
              height: size.height * 0.1,
              width: size.width * 0.2,
              fit: BoxFit.cover,
            ),
            SizedBox(height: size.height * 0.02),
            
            Text(
              "Please watch the following\nshort videos and answer the\nmultiple choice questions\nto ensure you know what\nto do when alerted.",  
               textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                height: 1.3,
                  fontWeight: FontWeight.bold, color: MyTheme.secondryColor),
            ),
            
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: onCancel,
                  child: Text("CANCEL", style: TextStyle(
                    fontSize: 20,
                    color: MyTheme.black,
                    fontWeight: FontWeight.bold
                  ),)),
                SizedBox(width:30),
                RoundedBorderTextButton(
                  textColor: MyTheme.secondryColor,
                  title: "CONTINUE",
                  fontSize: 20,
                  bgColor: MyTheme.primaryColor,
                  height: size.height * 0.055,
                  width: size.width * 0.4,
                  onTap: onContinue,
                   borderColor: MyTheme.primaryColor,
                    borderRadius: 80,
                )
              ],
            )

          ],
        ));
  }
}
////////// HelpNeeded Dialog Box ///////////

class HelpNeededDialogBox extends StatelessWidget {
   final void Function() illgo;
  final void Function() icant;


  const HelpNeededDialogBox({Key key, @required this.illgo ,@required this.icant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.28,
        margin: EdgeInsets.only(left: 12, right: 12),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: HelpNeededDialogBody(illgo: illgo, icant: icant,),
        ));
  }
}

class HelpNeededDialogBody extends StatelessWidget {
  final void Function() illgo;
  final void Function() icant;

  const HelpNeededDialogBody({Key key, @required this.illgo, @required this.icant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.02),
            RoundedBorderTextButton(
              textColor: MyTheme.secondryColor,
              bgColor: MyTheme.white,
              borderColor: MyTheme.secondryColor,
              borderRadius: 5,
              title: "HELP NEEDED",
              fontSize: 20,
              height: size.height * 0.049,
              width: size.width * 0.4,
              onTap: (){},
            ),
            SizedBox(height: size.height * 0.01),
            ListTile(
              //  minLeadingWidth: 40,
              leading: UserAvatarAsset(
                  avatarRadius: size.height * 0.07,
                  asset:"assets/users/CrystalGaskell.png", 
                  // imageUrl:
                  //     "https://img.mensxp.com/media/content/2020/Aug/Michele-Morrone-From-365-Days-Floored-Us-With-His-Fashion-Game-1200x900_5f2a761253b66_1200x900.jpeg"
                  ),
              title: Text(
                "CRYSTAL GASKELL",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
              subtitle: Text(
                "200m away",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedBorderTextButton(
                  textColor: MyTheme.secondryColor,
                  title: "I CAN'T",
                  bgColor: MyTheme.red,
                  height: size.height * 0.06,
                  width: size.width * 0.38,
                  onTap: icant,
                  borderColor: MyTheme.red,
                  borderRadius: 8,
                  fontSize: 20,
                ),
                RoundedBorderTextButton(
                  textColor: MyTheme.secondryColor,
                  title: "I'LL GO",
                  bgColor: MyTheme.primaryColor,
                  height: size.height * 0.06,
                  width: size.width * 0.38,
                  onTap: icant,
                  borderColor: MyTheme.primaryColor,
                  borderRadius: 8,
                  fontSize: 20,
                ),
              ],
            )
          ],
        ));
  }
}


////////// Ill And Icant Dialog Body ///////////

class IllAndIcantDialogBox extends StatelessWidget {
   final void Function() illgo;
  final void Function() icant;
   final String title;
   final LinearGradient gradient;


  const IllAndIcantDialogBox({Key key,
   @required this.illgo ,@required this.icant,
    @required this.title, @required this.gradient}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.28,
        margin: EdgeInsets.only(left: 12, right: 12),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: IllAndIcantDialogBody(
            title: title,
            illgo: illgo, 
            icant: icant,
            gradient: gradient
            ),
        ));
  }
}

class IllAndIcantDialogBody extends StatelessWidget {
  final void Function() illgo;
  final void Function() icant;
  final String title;
  final LinearGradient gradient;

  const IllAndIcantDialogBody({Key key,
   @required this.illgo, @required this.icant , 
   @required this.title,  @required this.gradient}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        // padding: const EdgeInsets.only( bottom: ),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              width: size.width,
              height: size.height * 0.065,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // color: MyTheme.primaryColor,
                gradient: gradient,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  Text(
                    "$title ALERT",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: MyTheme.secondryColor),
                  ),
                  SizedBox(width:10),
                   Image.asset("assets/icons/alert.png", height: 30, width: 30,),
                ],
              )
            ),
            SizedBox(height: size.height * 0.01),
            ListTile(
              //  minLeadingWidth: 40,
              leading: UserAvatarAsset(
                  avatarRadius: size.height * 0.07,
                  asset: "assets/users/CrystalGaskell.png",
                  // imageUrl:
                  //     "https://img.mensxp.com/media/content/2020/Aug/Michele-Morrone-From-365-Days-Floored-Us-With-His-Fashion-Game-1200x900_5f2a761253b66_1200x900.jpeg"
                  ),
              title: Text(
                "CRYSTAL GASKELL",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
              subtitle: Text(
                "200m away",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedBorderTextButton(
                  textColor: MyTheme.secondryColor,
                  title: "I CAN'T",
                  bgColor: MyTheme.red,
                  height: size.height * 0.06,
                  width: size.width * 0.38,
                  onTap: icant,
                  borderColor: MyTheme.red,
                  borderRadius: 8,
                  fontSize: 20,
                ),
               
                RoundedBorderTextButton(
                  textColor: MyTheme.secondryColor,
                  title: "I'LL GO",
                  bgColor: MyTheme.primaryColor,
                  height: size.height * 0.06,
                  width: size.width * 0.38,
                  onTap: illgo,
                  borderColor: MyTheme.primaryColor,
                  borderRadius: 8,
                  fontSize: 20,
                ),
              ],
            )
          ],
        ));
  }
}


////// Report To Anyone Dialog Box /////////
class ReportToAnyoneDialogBox extends StatelessWidget {
    final void Function() onLater;
  final void Function() onContinue;
 


  const ReportToAnyoneDialogBox({Key key, @required this.onLater ,@required this.onContinue,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.3,
        margin: EdgeInsets.only(left: 12, right: 12),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: ReportToAnyoneDialogBody(
           
            onLater: onLater, 
            onContinue: onContinue,),
        ));
  }
}

class ReportToAnyoneDialogBody extends StatelessWidget {
  final void Function() onLater;
  final void Function() onContinue;
 

  const ReportToAnyoneDialogBody({Key key, @required this.onLater, @required this.onContinue }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double startPoint = 30;
    return Container(
        // padding: const EdgeInsets.only( bottom: ),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              width: size.width,
              height: size.height * 0.065,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MyTheme.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              ),
              child:  Text(
                "REPORT ANYONE?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              // color: MyTheme.red,
              // width: size.width,
                      height: size.height * 0.14,
                      alignment: Alignment.center,
                      child: Stack(
                       alignment: AlignmentDirectional.center,
                        children: [
                          // Positioned(
                          //   left: startPoint,
                          //   child: 
                          //   // UserAvatar(
                          //   //     imageUrl:
                          //   //         "https://wallpaperaccess.com/full/3957694.jpg",
                          //   //     avatarRadius: size.height * 0.08),
                          //    UserAvatarAsset(
                          //       asset:"assets/users/CrystalGaskell.png",
                          //       avatarRadius: size.height * 0.12),
                          // ),
                          Positioned(
                            left: startPoint * 2,
                            child: UserAvatarAsset(
                                asset:"assets/users/DavidElks.png",
                                avatarRadius: size.height * 0.08),
                          ),
                          Positioned(
                            left: startPoint * 3.4,
                            child: UserAvatarAsset(
                                asset:"assets/users/AshleyJudd.png",
                                avatarRadius: size.height * 0.08),
                          ),
                          Positioned(
                            left: startPoint * 4.7,
                            child: UserAvatarAsset(
                                asset:"assets/users/RohitShah.png",
                                avatarRadius: size.height * 0.08),
                          ),
                          
                          Positioned(
                            left: startPoint * 5.9,
                            child: UserAvatarAsset(
                                asset:"assets/users/WinnieLu.png",
                                avatarRadius: size.height * 0.08),
                          ),
                          

                           Positioned(
                            left: startPoint * 7,
                            child: UserAvatarAsset(
                                asset:"assets/users/AlanPost.png",
                                avatarRadius: size.height * 0.08),
                          ),
                          
                        ],
                      ),
                    ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedBorderTextButton(
                  textColor: MyTheme.secondryColor,
                  title: "LATER",
                  bgColor: MyTheme.white,
                  height: size.height * 0.06,
                  width: size.width * 0.38,
                  onTap: onLater,
                  borderColor: MyTheme.white,
                  borderRadius: 8,
                  fontSize: 18,
                ),
                RoundedBorderTextButton(
                  textColor: MyTheme.secondryColor,
                  title: "CONTINUE",
                  bgColor: MyTheme.primaryColor,
                  height: size.height * 0.06,
                  width: size.width * 0.38,
                  onTap: onContinue,
                  borderColor: MyTheme.primaryColor,
                  borderRadius: 80,
                  fontSize: 18,
                ),
              ],
            )
          ],
        ));
  }
}

////// Ended alert Dialog Box /////////
class EndedAlertDialogBox extends StatelessWidget {
  
  final void Function() onContinue;
  const EndedAlertDialogBox({Key key,@required this.onContinue,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.28,
        margin: EdgeInsets.only(left: 12, right: 12),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: EndedAlertDialogBody(
           
            onContinue: onContinue,),
        ));
  }
}


class EndedAlertDialogBody extends StatelessWidget {

  final void Function() onContinue;
 

  const EndedAlertDialogBody({Key key, @required this.onContinue ,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.topCenter,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              width: size.width,
              height: size.height * 0.09,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MyTheme.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ALERT ENDED",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: MyTheme.secondryColor),
                  ),
                  Text(
                    "THANK YOU FOR HELPING",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        
                        color: MyTheme.black),
                  ),
                ],
              )
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              margin: const EdgeInsets.only(left:30),
              child: ListTile(
                //  minLeadingWidth: 40,
                leading: UserAvatarAsset(
                    avatarRadius: size.height * 0.07,
                    asset:"assets/users/CrystalGaskell.png", 
                        // "https://img.mensxp.com/media/content/2020/Aug/Michele-Morrone-From-365-Days-Floored-Us-With-His-Fashion-Game-1200x900_5f2a761253b66_1200x900.jpeg"
                        ),
                title: Text(
                  "CRYSTAL GASKELL",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.secondryColor),
                ),
                
              ),
            ),
            SizedBox(height: size.height * 0.01),
            RoundedBorderTextButton(
              textColor: MyTheme.secondryColor,
              title: "CONTINUE",
              bgColor: MyTheme.primaryColor,
              height: size.height * 0.06,
              width: size.width * 0.38,
              onTap: onContinue,
              borderColor: MyTheme.primaryColor,
              borderRadius: 80,
              fontSize: 20,
            ),
          ],
        ));
  }
}




////HELPING SUCCESS DIALOG BOX
class HelpingSuccessDialogBox extends StatelessWidget {
  final void Function() onContinue;

  const HelpingSuccessDialogBox({Key key, this.onContinue}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.25,
        margin: EdgeInsets.only(left: 12, right: 12),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: HelpingSuccessDialogBody(onContinue: onContinue),
        ));
  }
}

class HelpingSuccessDialogBody extends StatelessWidget {
  final void Function() onContinue;

  const HelpingSuccessDialogBody({Key key, this.onContinue}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.02),
            RoundedBorderTextButton(
              textColor: MyTheme.secondryColor,
              bgColor: MyTheme.white,
              borderColor: MyTheme.secondryColor,
              borderRadius: 5,
              title: "THANKS FOR HELP",
              fontSize: 20,
              height: size.height * 0.049,
              width: size.width * 0.6,
              onTap: onContinue,
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UserAvatarAsset(
                    avatarRadius: size.height * 0.07,
                    asset:"assets/users/CrystalGaskell.png", 
                    // imageUrl:
                    //     "https://img.mensxp.com/media/content/2020/Aug/Michele-Morrone-From-365-Days-Floored-Us-With-His-Fashion-Game-1200x900_5f2a761253b66_1200x900.jpeg"
                    ),
                // SizedBox(width:  size.width * 0.06),
                Text(
                  "CRYSTAL GASKELL",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.secondryColor),
                ),
              ],
            ),
            // ListTile(
            // //  minLeadingWidth: 40,
            //   leading: UserAvatar(
            //     avatarRadius :size.height * 0.07,
            //     imageUrl : "https://img.mensxp.com/media/content/2020/Aug/Michele-Morrone-From-365-Days-Floored-Us-With-His-Fashion-Game-1200x900_5f2a761253b66_1200x900.jpeg"
            //   ),
            //   title: Text("CRYSTAL GASKELL",
            //     style: TextStyle(
            //       fontSize:  18 ,
            //       fontWeight: FontWeight.bold,
            //       color: MyTheme.secondryColor),
            //     ),

            // ),
            SizedBox(height: size.height * 0.01),

            RoundedBorderTextButton(
              textColor: MyTheme.secondryColor,
              title: "CONTINUE",
              bgColor: MyTheme.primaryColor,
              height: size.height * 0.06,
              width: size.width * 0.38,
              onTap: onContinue,
              borderColor: MyTheme.primaryColor,
              borderRadius: 80,
              fontSize: 20,
            ),
          ],
        ));
  }
}

////CONGRATULATION DIALOG BOX
class CongratulationDialogBox extends StatelessWidget {
  final void Function() onContinue;

  const CongratulationDialogBox({Key key, this.onContinue}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.25,
        margin: EdgeInsets.only(left: 12, right: 12),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: CongratulationDialogBody(onContinue: onContinue),
        ));
  }
}

class CongratulationDialogBody extends StatelessWidget {
  final void Function() onContinue;

  const CongratulationDialogBody({Key key, this.onContinue}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        // padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: size.height * 0.06,
              width: size.width,
              decoration: BoxDecoration(
                  color: MyTheme.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Text(
                "Congratulations",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
            ),
            // SizedBox(height: size.height * 0.02),

            SizedBox(height: size.height * 0.04),
            Text(
              "Your pin has been changed",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.secondryColor),
            ),

            SizedBox(height: size.height * 0.04),

            RoundedBorderTextButton(
              textColor: MyTheme.secondryColor,
              title: "CONTINUE",
              bgColor: MyTheme.primaryColor,
              height: size.height * 0.06,
              width: size.width * 0.38,
              onTap: onContinue,
              borderColor: MyTheme.primaryColor,
              borderRadius: 80,
              fontSize: 20,
            ),
          ],
        ));
  }
}

////LOGOUT DIALOG BOX
class LogoutDialogBox extends StatelessWidget {
  final void Function() onLogout;
  final void Function() onCancel;


  const LogoutDialogBox({Key key, this.onLogout ,this.onCancel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.25,
        margin: EdgeInsets.only(left: 12, right: 12),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: LogoutDialogBody(
            onCancel:onCancel,
            onLogout: onLogout),
        ));
  }
}

class LogoutDialogBody extends StatelessWidget {
  final void Function() onLogout;
    final void Function() onCancel;

  const LogoutDialogBody({Key key, this.onLogout, this.onCancel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        // padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        // color: MyTheme.white,
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: size.height * 0.06,
              width: size.width,
              decoration: BoxDecoration(
                  color: MyTheme.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Text(
                "Logout?",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
            ),
            // SizedBox(height: size.height * 0.02),

            SizedBox(height: size.height * 0.04),
            Text(
              "Are you sure want to logout?",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.secondryColor),
            ),

            SizedBox(height: size.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedBorderTextButton(
                  textColor: MyTheme.secondryColor,
                  title: "CANCEL",
                  bgColor: MyTheme.white,
                  height: size.height * 0.06,
                  width: size.width * 0.38,
                  onTap: onCancel,
                  borderColor: MyTheme.white,
                  borderRadius: 80,
                  fontSize: 20,
                ),
                RoundedBorderTextButton(
                  textColor: MyTheme.secondryColor,
                  title: "LOGOUT",
                  bgColor: MyTheme.primaryColor,
                  height: size.height * 0.06,
                  width: size.width * 0.38,
                  onTap: onLogout,
                  borderColor: MyTheme.primaryColor,
                  borderRadius: 80,
                  fontSize: 20,
                ),
              ],
            )
          ],
        ));
  }
}

////WINING LOSING DIALOG BOX
class WiningLoseDialogBox extends StatelessWidget {
  final void Function() onContinue;

  const WiningLoseDialogBox({Key key, this.onContinue}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.5,
        margin: EdgeInsets.only(left: 12, right: 12),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: WiningLoseBody(onContinue: onContinue),
        ));
  }
}

class WiningLoseBody extends StatelessWidget {
  final void Function() onContinue;

  const WiningLoseBody({Key key, this.onContinue}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _winLose(size),
            SizedBox(
              height: size.height * 0.04
            ),
            _mid(size),
            
            SizedBox(
              height: size.height * 0.06
            ),
            RoundedBorderTextButton(
              textColor: MyTheme.secondryColor,
              title: "BACK TO HOME",
              bgColor: MyTheme.primaryColor,
              height: size.height * 0.06,
              width: size.width * 0.5,
              onTap: onContinue,
              borderColor: MyTheme.primaryColor,
              borderRadius: 80,
              fontSize: 20,
            ),
          ],
        ));
  }

 _winLose(Size size){
   return Container(
    alignment: Alignment.center,
    height: size.height * 0.1,
    width: size.height * 0.1,
    decoration: BoxDecoration(
        color: MyTheme.primaryColor,
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
            fit: BoxFit.cover)),
  );
 }

  _mid(Size size){
    return Container(
        alignment: Alignment.center,
        height: size.height * 0.15,
        width: size.width,
        decoration: BoxDecoration(
          color: MyTheme.primaryColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _chip(size, "Total\nQuestions", "5", MyTheme.secondryColor),
             _chip(size, "Correct", "1", MyTheme.green),
              _chip(size, "Wrong", "4", MyTheme.red),
           
          ],
        ),
      );
  }

  _chip(Size size, String title, String score, Color scoreColor){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Text(
          title,
           textAlign: TextAlign.center,
          style: TextStyle(
            
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: MyTheme.secondryColor),
        ),
        SizedBox(height: size.height * 0.01),

        Container(
          alignment: Alignment.center,
          height: size.height * 0.05,
          width: size.height * 0.05,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyTheme.white,

          ),
          child:  Text(
          score,
         
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: scoreColor),
        ),
        )
        
      ],

    );
  }
}



////////// Notification DialogBox ///////////
class NotificationDialogBox extends StatelessWidget {
  final void Function() onHangUp;
  final void Function() onRecieve;


  const NotificationDialogBox({Key key, this.onHangUp ,this.onRecieve}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.17,
        margin: EdgeInsets.only(left: 12, right: 12),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: NotificationBody(
            onHangUp:onHangUp,
            onRecieve: onRecieve),
        ));
  }
}

class NotificationBody extends StatelessWidget {
  final void Function() onHangUp;
    final void Function() onRecieve;

  const NotificationBody({Key key, this.onHangUp, this.onRecieve}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.only(left:10, top:10, right: 10),
        
        // alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: MyTheme.primaryColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: MyTheme.secondryColor, width: 1)
                      ),
                      child:  Image.asset("assets/images/logo.png", height: 20, width: 20,),
                    ),
                    SizedBox(width:10),
                    Text(
                      "URGENT ALERT",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: MyTheme.secondryColor),
                    ),
                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: onHangUp,
                      child: Image.asset("assets/icons/circularCross.png", height: 33, width: 33,)),
                    SizedBox(width:10),

                    InkWell(
                      onTap: (){},
                      child: Image.asset("assets/icons/circularDone.png", height: 33, width: 33)),
                  ],
                ),
              ],
            ),
            // SizedBox(height: size.height * 0.02),
            ListTile(
              //  minLeadingWidth: 40,
              leading: UserAvatarAsset(
                  avatarRadius: size.height * 0.07,
                  asset: "assets/users/CrystalGaskell.png",
                  // imageUrl:
                  //     "https://img.mensxp.com/media/content/2020/Aug/Michele-Morrone-From-365-Days-Floored-Us-With-His-Fashion-Game-1200x900_5f2a761253b66_1200x900.jpeg"
                  ),
              title: Text(
                "CRYSTAL GASKELL",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
              subtitle: Text(
                "200m away",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.secondryColor),
              ),
            ),
          ],
        ));
  }
}

