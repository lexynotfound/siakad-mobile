import 'package:dartz/dartz.dart';
import '../../data/models/response/khs_response_model.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../datasources/auth_local_datasources.dart';

class KhsRemoteDatasource {
  Future<Either<String, KhsResponseModel>> getKhs() async {
    final header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'authorization': 'Bearer ${await AuthLocalDataSource().getToken()}',
    };
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/khs'),
      headers: header,
    );

    if (response.statusCode == 200) {
      return Right(KhsResponseModel.fromJson(response.body));
    } else {
      return const Left('server error');
    }
  }
}
