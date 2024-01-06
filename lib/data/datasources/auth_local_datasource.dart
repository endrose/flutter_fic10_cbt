// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

import '../models/responses/auth_response_model.dart';

class AuthLocalDatasource {
  Future<void> saveAuthData(AuthResponseModel authResponseModel) async {
    final pref = await SharedPreferences.getInstance();

    await pref.setString('auth_data', authResponseModel.toJson());
  }

  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth_data');
  }

  Future<AuthResponseModel> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final authData = pref.getString('auth_data');
    return AuthResponseModel.fromJson(authData!);
  }

  // Future<void> saveAuthData(AuthResponseModel authResponseModel) async {
  //   final pref = await SharedPreferences.getInstance();
  //   await pref.setString('auth_data', authResponseModel.toJson());
  // }

  // Future<void> removeAuthData() async {
  //   final preff = await SharedPreferences.getInstance();
  //   await preff.remove('auth_data');
  // }

  // Future<AuthResponseModel?> getAuthData() async {
  //   final preff = await SharedPreferences.getInstance();
  //   // final authMeta = await SharedPreferences.getInstance();
  //   final authData = preff.getString('auth_data');
  //   if (authData != null) {
  //     return AuthResponseModel.fromJson(authData);
  //   } else {
  //     return null;
  //   }
  // }
}
