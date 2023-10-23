import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../data/models/request/auth_request_model.dart';
import '../../data/datasources/auth_local_datasources.dart';
import '../../data/models/response/auth_response_model.dart';

import '../../core/constants/variables.dart';

class AuthRemoteDatasource{
  Future<Either<String, AuthResponseModel>> login(
    AuthRequestModel requestModel, /* String token */) async{
    final headers = {
        'Accept' : 'application/json',
        'Content-type' : 'application/json',
        /* 'Authorization': 'Bearer $token', */
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      headers: headers,
      body: requestModel.toJson(),
    );

    if(response.statusCode == 200){
      return Right(AuthResponseModel.fromJson(response.body));
    }else{
      return const Left('server error');
    }
  }

  Future<Either<String, String>> logout() async{
    final headers = {
      'Accept': 'application/json',
      'Content-type': 'application/json',
      'Authorization': 'Bearer ${await AuthLocalDataSource().getToken()}',
    };

    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/logout'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return const Right('Logout Success');
    } else {
      return const Left('server error');
    }
  }

}