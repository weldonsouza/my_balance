import 'package:my_balance/shared/models/coin_model.dart';

class ListCoinsModel {
  final CoinModel? uSDBRL;
  final CoinModel? bRLEUR;
  final CoinModel? bTCBRL;

  ListCoinsModel({
    this.uSDBRL,
    this.bRLEUR,
    this.bTCBRL,
  });

  ListCoinsModel.fromJson(Map<String, dynamic> json)
      : uSDBRL = (json['USDBRL'] as Map<String, dynamic>?) != null
            ? CoinModel.fromJson(json['USDBRL'] as Map<String, dynamic>)
            : null,
        bRLEUR = (json['BRLEUR'] as Map<String, dynamic>?) != null
            ? CoinModel.fromJson(json['BRLEUR'] as Map<String, dynamic>)
            : null,
        bTCBRL = (json['BTCBRL'] as Map<String, dynamic>?) != null
            ? CoinModel.fromJson(json['BTCBRL'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'USDBRL': uSDBRL?.toJson(),
        'BRLEUR': bRLEUR?.toJson(),
        'BTCBRL': bTCBRL?.toJson()
      };
}
