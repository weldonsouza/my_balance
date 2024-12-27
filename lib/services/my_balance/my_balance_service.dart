import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_balance/services/my_balance/errors/my_balance_error.dart';
import 'package:my_balance/shared/models/list_coins_model.dart';
import 'package:my_balance/utils/constants/constants_backend.dart';

class MyBalanceService {
  var dio = Dio();

  Future<Either<MyBalanceError?, ListCoinsModel?>> getCoins() async {
    try {
      final response = await dio.get(
        '${ConstantsBackend.BASE_URL}${ConstantsBackend.BASE_PARAMETERS}',
      );

      ListCoinsModel result = ListCoinsModel.fromJson(response.data);

      return Right(result);
    } on DioException catch (error) {
      return Left(MyBalanceError.fromException(error));
    }
  }
}
