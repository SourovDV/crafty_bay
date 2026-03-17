import 'dart:convert';

import 'package:crafty_bay/feature/data/userModel/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{
  final String _tokenKey= "token";
  final String _user="user";

  String ?token;
  UserModel ?user;

   Future<void> saveUserData(String access_token, UserModel model)async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.setString(_tokenKey,access_token);
    sharedPreferences.setString(_user,jsonEncode(model.toJson()));
  }

  Future<void> getUserData()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    token =sharedPreferences.getString(_tokenKey);
    String? model= sharedPreferences.getString(_user);
    if(model != null){
      user= UserModel.fromJson(jsonDecode(model));
    }
  }

  Future<bool> isLoggedIn()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    String ? Token = sharedPreferences.getString(_tokenKey);
    if(Token != null){
      await getUserData();
      return true;
    }
    return false;
  }

  Future<void> clearData()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }


}