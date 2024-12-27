import 'package:my_balance/services/my_balance/errors/my_balance_error.dart';
import 'package:my_balance/services/my_balance/my_balance_service.dart';
import 'package:my_balance/shared/models/coin_model.dart';
import 'package:flutter/material.dart';
import 'package:my_balance/shared/models/list_coins_model.dart';

class HomeController with ChangeNotifier {
  final MyBalanceService myBalanceService = MyBalanceService();

  bool isLoading = false;
  MyBalanceError error = MyBalanceError();
  double balance = 12150;
  List<CoinModel>? listCoins = [];

  setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  setError(MyBalanceError value) {
    error = value;
    setIsLoading(false);
  }

  setBalance(value) {
    balance = value;
    notifyListeners();
  }

  setListCoin(ListCoinsModel value) {
    ///Foi necessario fazer uma adaptação, api tem um padrao bem estranho
    listCoins!.add(value.bRLEUR!);
    listCoins!.add(value.uSDBRL!);
    listCoins!.add(value.bTCBRL!);
    notifyListeners();
  }

  Future getCoins() async {
    listCoins!.clear();
    setIsLoading(true);

    final result = await myBalanceService.getCoins();

    result.fold(
      (error) async => setError(error as MyBalanceError),
      (success) => setListCoin(success!),
    );

    setIsLoading(false);
  }
}
