import 'package:dartz/dartz.dart';
import 'package:goldy/core/networking/api_constants.dart';
import 'package:goldy/core/networking/dio_helper.dart';
import 'package:goldy/features/gold/data/models/gold_model.dart';

class GoldRepo {
  Future<Either<String , GoldModel>> getGold() async {
    try {
  final response = await DioHelper.get(endPoint: DioEndpoints.goldEndpoint);
  return right(GoldModel.fromJson(response.data));
} on Exception catch (e) {
  return left(e.toString());
}

  }
}
