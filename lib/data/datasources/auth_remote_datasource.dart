import 'package:dartz/dartz.dart';
import 'package:fic10_cbt/core/constants/variables.dart';
import 'package:fic10_cbt/data/datasources/auth_local_datasource.dart';
import 'package:fic10_cbt/data/models/request/login_request_model.dart';
import 'package:fic10_cbt/data/models/request/register_request_model.dart';
import 'package:fic10_cbt/data/models/responses/auth_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel registerRequestModel) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/register'),
      headers: <String, String>{'Content-Type': 'Application/json'},
      body: registerRequestModel.toJson(),
    );

    if (response.statusCode == 200) {
      return right(
        AuthResponseModel.fromJson(response.body),
      );
    } else {
      return const Left('register gagal');
    }
  }

  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
        Uri.parse('${Variables.baseUrl}/api/logout'),
        headers: <String, String>{
          'Content-Type': 'Application/json',
          'Accept': 'Application/json',
          'Authentication': 'Bearer ${authData.accessToken}'
        });

    if (response.statusCode == 200) {
      print({logout: response});
      return const Right('logout berhasil');
    } else {
      return const Left('logout gagal');
    }
  }

  // LOGIN
  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel data) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      headers: <String, String>{
        'Content-Type': 'Application/json',
        'Accept': 'Application/json'
      },
      body: data.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Login gagal');
    }
  }
}
