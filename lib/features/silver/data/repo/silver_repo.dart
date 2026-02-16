import 'package:dartz/dartz.dart';
import 'package:goldy/core/networking/api_constants.dart';
import 'package:goldy/core/networking/dio_helper.dart';
import 'package:goldy/features/silver/data/models/silver_model.dart';

class SilverRepo {
  Future<Either<String , SilverModel>> getSilver() async {
    try {
  final response = await DioHelper.get(endPoint: DioEndpoints.silverEndpoint);
  return right(SilverModel.fromJson(response.data));
} on Exception catch (e) {
  return left(e.toString());
}

  }
}
