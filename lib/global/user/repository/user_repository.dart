import 'dart:async';


import 'package:upstanders/global/local/local_data_helper.dart';
import 'package:upstanders/global/user/model/user.dart';

import 'package:uuid/uuid.dart';


class UserRepository {
  User _user;
  LocalDataHelper localDataHelper  = LocalDataHelper();

  Future<User> getUser() async {
    if (_user != null) return _user;
     var token = await localDataHelper.getStringValue(key: "token");
    return Future.delayed(
      const Duration(milliseconds: 300),
     
      () => _user = User(token),
    );
  }
}
