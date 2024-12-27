import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:my_balance/services/my_balance/errors/my_balance_error.dart';
import 'package:my_balance/services/my_balance/my_balance_service.dart';
import 'package:my_balance/shared/controllers/home_controller.dart';
import 'package:my_balance/shared/models/coin_model.dart';
import 'package:my_balance/shared/models/list_coins_model.dart';

@GenerateMocks([MyBalanceService])
import 'my_balance_controller_test.mocks.dart';

void main() {
  group('HomeController Tests', () {
    late HomeController homeController;
    late MockMyBalanceService mockMyBalanceService;
    late ListCoinsModel coins;

    setUp(() {
      mockMyBalanceService = MockMyBalanceService();
      homeController = HomeController();
      coins = ListCoinsModel(
        bRLEUR: CoinModel(code: 'BRL', ask: '1.0'),
        uSDBRL: CoinModel(code: 'USD', ask: '5.0'),
        bTCBRL: CoinModel(code: 'BTC', ask: '200000.0'),
      );
    });

    test('Initial values are correct', () {
      expect(homeController.isLoading, false);
      expect(homeController.balance, 12150);
      expect(homeController.listCoins, []);
    });

    test('setIsLoading updates isLoading and notifies listeners', () {
      bool listenerCalled = false;
      homeController.addListener(() {
        listenerCalled = true;
      });

      homeController.setIsLoading(true);

      expect(homeController.isLoading, true);
      expect(listenerCalled, true);
    });

    test('setError updates error, stops loading and notifies listeners', () {
      bool listenerCalled = false;
      homeController.addListener(() {
        listenerCalled = true;
      });

      MyBalanceError error = MyBalanceError(errorMessage: 'Error');
      homeController.setError(error);

      expect(homeController.error, error);
      expect(homeController.isLoading, false);
      expect(listenerCalled, true);
    });

    test('setBalance updates balance and notifies listeners', () {
      bool listenerCalled = false;
      homeController.addListener(() {
        listenerCalled = true;
      });

      double newBalance = 15000;
      homeController.setBalance(newBalance);

      expect(homeController.balance, newBalance);
      expect(listenerCalled, true);
    });

    test('setListCoin adds coins to the list and notifies listeners', () {
      bool listenerCalled = false;
      homeController.addListener(() {
        listenerCalled = true;
      });

      homeController.setListCoin(coins);

      expect(homeController.listCoins, contains(coins.bRLEUR));
      expect(homeController.listCoins, contains(coins.uSDBRL));
      expect(homeController.listCoins, contains(coins.bTCBRL));
      expect(listenerCalled, true);
    });

    test('getCoins retrieves coins from service and updates state', () async {
      when(mockMyBalanceService.getCoins()).thenAnswer((_) async => Right(coins));

      await homeController.getCoins();

      expect(homeController.isLoading, false);
      expect(homeController.listCoins!.first.code, contains(coins.bRLEUR!.code));
    });

    test('getCoins handles error from service and updates state', () async {
      MyBalanceError error = MyBalanceError(errorMessage: 'Error');

      when(mockMyBalanceService.getCoins()).thenAnswer((_) async => Left(error));

      await homeController.getCoins();

      expect(homeController.isLoading, false);
      expect(homeController.error.code, error.code);
    });
  });
}
