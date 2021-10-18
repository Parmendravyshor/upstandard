import 'package:background_location/background_location.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:upstanders/global/local/local_data_helper.dart';
import 'package:upstanders/global/theme/colors.dart';

import 'package:upstanders/login/view/view.dart';
import 'package:upstanders/notification/notification_helper.dart';

import 'package:upstanders/register/view/view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String _heading = "Standing up as a community\nagainst sexual violence";
  LocalDataHelper localDataHelper = LocalDataHelper();
   String latitude = 'waiting...';
  String longitude = 'waiting...';
  String altitude = 'waiting...';
  String accuracy = 'waiting...';
  String bearing = 'waiting...';
  String speed = 'waiting...';
  String time = 'waiting...';
   String _token;
  


  @override
  void initState() {
    super.initState();
  //  pushNotification();
   getToken();
    navigateToNextScreen();
    localDataHelper.saveValue(key: "IsActive",value:false);

  
    
  }

  navigateToNextScreen(){
    Future.delayed(Duration(seconds: 3), ()async{
      String token = await localDataHelper.getStringValue(key: "token");
      print("tokennnnnnnnnnnn :$token");
      //  Navigator.of(context).pushAndRemoveUntil(
      //   MaterialPageRoute(builder: (context)=>OnboardingScreen()),
      //    (route) => false);
      if(token!=null && token!=''){
        print("token token token token :$token");
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context)=>LoginScreen()),
         (route) => false);

      }else{

      }
       
      
     
    });
  }

  getToken()async{
    NotificationHelper helper = NotificationHelper();
    var fcmToken = await helper.getToken();
    print("fcm fcm fcm fcm fcm fcm fcm:$fcmToken");

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


  // pushNotification(){
  //    FirebaseMessaging.instance
  //       .getInitialMessage()
  //       .then((RemoteMessage message) {
  //     // if (message != null) {
  //     //   Navigator.pushNamed(context, '/message',
  //     //       arguments: MessageArguments(message, true));
  //     // }
  //   });
  //   getToken();
  
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     RemoteNotification notification = message.notification;
  //     AndroidNotification android = message.notification?.android;
  //     if (notification != null && android != null && !kIsWeb) {
  //       // flutterLocalNotificationsPlugin.show(
  //       //     notification.hashCode,
  //       //     notification.title,
  //       //     notification.body,
  //       //     NotificationDetails(
  //       //       android: AndroidNotificationDetails(
  //       //         channel.id,
  //       //         channel.name,
  //       //         channel.description,
  //       //         // TODO add a proper drawable resource to android, for now using
  //       //         //      one that already exists in example app.
  //       //         icon: 'launch_background',
  //       //       ),
  //       //     ));
  //     }
  //   });

  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     print('A new onMessageOpenedApp event was published!');
     
  //   });
  // }
  


  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: MyTheme.primaryColor,
      body: Stack(
        children: [
         Container(
            decoration: BoxDecoration(
              image:DecorationImage(
                image:  AssetImage("assets/images/dfhgfdsg.png"),
                fit: BoxFit.cover
              )
            
            ),
          ),

          Container(
            alignment: Alignment.center,
            child:Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height:size.height * 0.25),
                
                Center(
                  child: Card( // with Card
                   color: MyTheme.transparent,
                    child: Image.asset("assets/images/logo.png",
                     height: size.height * 0.25,
                     width: size.width * 0.5,
                  
                    ),
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    ),
                    clipBehavior: Clip.antiAlias,

                  ),
                ),
                SizedBox(height:15),
                // Text(_heading,
                // textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     color: MyTheme.secondryColor,
                //     fontSize: 18
                //   ),
                // )
              ],
            )
          ),
        ],
      ),
    );
  }
