// import 'package:background_location/background_location.dart';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:upstanders/api/constants_api.dart';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:upstanders/global/local/local_data_helper.dart';
import 'package:upstanders/register/models/create_account.dart';

class Apis {
  LocalDataHelper localDataHelper = LocalDataHelper();

  Future<dynamic> login({@required String email, @required String pin,}) async {
    try {
      var url = Uri.parse("$BASE_URL/login");
      var response = await http.post(url, body: {'email': email, 'pin': pin});
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Map res = json.decode(response.body);

      return res;
    } catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }


  Future<dynamic> signup(
      {@required String email, @required String pin,}) async {
    try {
      var url = Uri.parse("$BASE_URL/signup");
      var response = await http.post(url, body: {'email': email, 'pin': pin});
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Map res = json.decode(response.body);


      return res;
    } catch (e) {
      print("Thrown Exception While signing Up:$e");
      throw e;
    }
  }

  Future<dynamic> sendOTP() async {
    var token = await localDataHelper.getStringValue(key: 'token');

    print("TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");


    try {
      var url = Uri.parse("$BASE_URL/send-otp");
      var response = await http.post(url,
        headers: {
          "Authorization": "$token"
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Map res = json.decode(response.body);


      return res;
    } catch (e) {
      print("Thrown Exception SENDING OTP:$e");
      throw e;
    }
  }

  Future<dynamic> verifyOTP({@required CreateAccount createAccount}) async {
    var token = await localDataHelper.getStringValue(key: 'token');
    var otp = await localDataHelper.getStringValue(key: 'otp');

    print("verifyOTP TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");
    print("verifyOTP OTPPPPPPPPPPPPP:$otp");


    try {
      var url = Uri.parse("$BASE_URL/verify-otp");
      var response = await http.post(url,
          headers: {
            "Authorization": "$token"
          },
          body: {"otp": "$otp"}
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Map res = json.decode(response.body);


      return res;
    } catch (e) {
      print("Thrown Exception Verifying OTP:$e");
      throw e;
    }
  }


  Future<dynamic> createAccount({@required CreateAccount createAccount}) async {
    print("CRREAT ACCOUNTTTTTTTTTTTTTTTTTTT________${createAccount.toJson()}");
    var token = await localDataHelper.getStringValue(key: 'token');
    //  Map<String, dynamic> data = jsonDecode(createAccount.toJson());

    var data = json.encode(createAccount.toJson());

    print("t t t t t t t t hhhhhh:$data ");

    try {
      var url = Uri.parse("$BASE_URL/update-profile");
      var response = await http.post(
          url,
          headers: {
            "Authorization": "$token"
          },
          body: data

      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Map res = json.decode(response.body);


      return res;
    } catch (e) {
      print("Thrown Exception While updating profile :$e");
      throw e;
    }
  }


  Future<dynamic> uploadImage({@required String file}) async {
    var token = await localDataHelper.getStringValue(key: 'token');

    try {
      var url = Uri.parse("$BASE_URL/upload");
      var response = await http.post(
          url,
          headers: {
            "Authorization": "$token"
          },
          body: {
            "image": "$file"
          }
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Map res = json.decode(response.body);
      return res;
    } catch (e) {
      print("Thrown Exception While uploading image :$e");
      throw e;
    }
  }

  Future<dynamic> upload({@required String file}) async {
    try {
      final File imageFile = File(file);
      var stream = new http.ByteStream(
          DelegatingStream.typed(imageFile.openRead()));
      var length = await imageFile.length();

      var uri = Uri.parse("$BASE_URL/upload");

      var request = new http.MultipartRequest("POST", uri,);
      var multipartFile = new http.MultipartFile('file', stream, length,
          filename: basename(imageFile.path));
      //contentType: new MediaType('image', 'png'));

      request.files.add(multipartFile);

      var response = await request.send();
      final respStr = await response.stream.bytesToString();
      print("respStr respStr respStr:$respStr");
      Map res = json.decode(respStr);
      //  print("UPLOADDIJNG    RESSSSPONSEEEEEEEEEEEEEEEEEEEEE :${response.stream}");

      // response.stream.transform(utf8.decoder).listen((value) {
      //   print(value);
      //   res = json.decode(value);


      // });
      return res;
    } catch (e) {
      print("Thrown Exception 2 While uploading image :$e");
      throw e;
    }
  }


// Future<dynamic> updateUserLoc({@required Position position}) async {
//   var token = await localDataHelper.getStringValue(key: 'token');
//   print("updateUserLoc TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");
//   print("position  position position position position___$position");
//
//
//   try {
//     var url = Uri.parse("$BASE_URL/update-user-location");
//     var response = await http.post(url,
//         headers: {
//           "Authorization": "$token"
//         },
//         body: {
//           "latitude": "${position.latitude}",
//           "longitude": "${position.longitude}"
//         }
//     );
//     print('Response status: ${response.statusCode}');
//     print('Response body: ${response.body}');
//     Map res = json.decode(response.body);
//
//
//     return res;
//   } catch (e) {
//     print("Thrown Exception While updating user location:$e");
//     throw e;
//   }
// }

// Future<dynamic> getAllNearbyUser({@required Position position}) async {
//   var token = await localDataHelper.getStringValue(key: 'token');
//   print("getAllNearbyUser TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");
//   print("position  position position position position___$position");
//
//   try {
//     var url = Uri.parse("$BASE_URL/get-all-nearby-user");
//     var response = await http.get(url,
//       headers: {
//         "Authorization": "$token"
//       },
//
//       // body: {
//       //   "latitude":"${position.latitude}",
//       //   "longitude":"${position.longitude}"
//       // }
//     );
//     print('Response status: ${response.statusCode}');
//     print('Response body: ${response.body}');
//     Map res = json.decode(response.body);
//
//
//     return res;
//   } catch (e) {
//     print("Thrown Exception While getting  all nearby user:$e");
//     throw e;
//   }
// }

// Future<dynamic> getmcqvideo() async {
//   //var token = await localDataHelper.getStringValue(key: 'token');
//   //print("getAllNearbyUser TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");
//
//
//   try {
//     var url = Uri.parse("$BASE_URL/get-mcq-video");
//     var response = await http.get(url,
//       headers: {
//         "Authorization": "$token"
//       },

// body: {
//   "latitude":"${position.latitude}",
//   "longitude":"${position.longitude}"
// }
//       );
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');
//       Map res = json.decode(response.body);
//
//
//       return res;
//     } catch (e) {
//       print("Thrown Exception While getting  all nearby user:$e");
//       throw e;
//     }
//   }
//
//   Future<dynamic> getparticular({@required videoold}) async {
//     var token = await localDataHelper.getStringValue(key: 'token');
//     print("getAllNearbyUser TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");
//     print("position  position position position position___$videoold");
//
//     try {
//       var url = Uri.parse("$BASE_URL/get-particular-video-question");
//       var response = await http.get(url,
//         headers: {
//           "Authorization": "$token"
//         },
//
//         // body: {
//         //   "latitude":"${position.latitude}",
//         //   "longitude":"${position.longitude}"
//         // }
//       );
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');
//       Map res = json.decode(response.body);
//
//
//       return res;
//     } catch (e) {
//       print("Thrown Exception While getting  all nearby user:$e");
//       throw e;
//     }
//   }
//   Future<dynamic> checkanswer(
//       {@required videoold,@required  answer}) async {
//     var token = await localDataHelper.getStringValue(key: 'token');
//     print("getAllNearbyUser TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");
//
//
//     try {
//       var url = Uri.parse("$BASE_URL/check-answer");
//       var response = await http.post(url,
//         headers: {
//           "Authorization": "$token"
//         },
//
//         body: {
//           "videoold":"${videoold}",
//           "answer":"${answer}"
//         }
//       );
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');
//       Map res = json.decode(response.body);
//
//
//       return res;
//     } catch (e) {
//       print("Thrown Exception While getting  all nearby user:$e");
//       throw e;
//     }
//
//   }
//   Future<dynamic> createalert(
//       {@required Position position}) async {
//     var token = await localDataHelper.getStringValue(key: 'token');
//     print("getAllNearbyUser TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");
//     print("position  position position position position___$position");
//
//     try {
//       var url = Uri.parse("$BASE_URL/create-alert");
//       var response = await http.post(url,
//           headers: {
//             "Authorization": "$token"
//           },
//
//           body: {
//             "latitude": "${position.latitude}",
//             "longitude": "${position.longitude}"
//           }
//       );
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');
//       Map res = json.decode(response.body);
//
//
//       return res;
//     } catch (e) {
//       print("Thrown Exception While getting  all nearby user:$e");
//       throw e;
//     }
//   }}
// // {
// //     "status": 200,
// //     "data": {
// //         "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo1LCJpYXQiOjE2MjQyNTc0NDd9.aSP_cszVU_bRtsuyQvqE3V89Fm3p8CWPnpwa6LMB6uo"
// //     },
// //     "message": "Account created successfully ."
// // }
//
// // url : 52.14.21.106:3000/api/v1/send-otp
// // method : post
// // params : none
//
// // url : 52.14.21.106:3000/api/v1/verify-otp
// // mthod : post
// // params : otp
//
//
// // url : 52.14.21.106:3000/api/v1/update-user-location
// // method : post
// // params : {
// //     "latitude":53.2734,
// //     "longitude":-7.77832031
// // }
//
//
// // 52.14.21.106:3000/api/v1/get-all-nearby-user
//
// // method : post
// // params : {
// //     "latitude":53.2734,
// //     "longitude":-7.77832031
// // }
//
//
// // url : 52.14.21.106:3000/api/v1/update-profile
// // method : post
// // params : first_name, last_name,  dob , gender , country_code , phone , image , license_image ,
// // latitude , longitude , fcm_token , pin , otp , account_status ,online_status
}