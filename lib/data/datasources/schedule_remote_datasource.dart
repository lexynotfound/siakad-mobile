import 'package:dartz/dartz.dart';
import '../../data/models/response/schedule_response_model.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../datasources/auth_local_datasources.dart';

class ScheduleRemoteDatasource {
  Future<Either<String, ScheduleResponseModel>> getSchedules() async {
    final header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'authorization': 'Bearer ${await AuthLocalDataSource().getToken()}',
    };
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/schedules'),
      headers: header,
    );

    if (response.statusCode == 200) {
      return Right(ScheduleResponseModel.fromJson(response.body));
    } else {
      return const Left('server error');
    }
  }
}
