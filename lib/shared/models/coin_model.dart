class CoinModel {
  final String? code;
  final String? codeIn;
  final String? name;
  final String? high;
  final String? low;
  final String? varBid;
  final String? pctChange;
  final String? bid;
  final String? ask;
  final String? timestamp;
  final String? createDate;

  CoinModel({
    this.code,
    this.codeIn,
    this.name,
    this.high,
    this.low,
    this.varBid,
    this.pctChange,
    this.bid,
    this.ask,
    this.timestamp,
    this.createDate,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      code: json['code'],
      codeIn: json['codein'],
      name: json['name'],
      high: json['high'],
      low: json['low'],
      varBid: json['varBid'],
      pctChange: json['pctChange'],
      bid: json['bid'],
      ask: json['ask'],
      timestamp: json['timestamp'],
      createDate: json['create_date'],
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'codein': codeIn,
        'name': name,
        'high': high,
        'low': low,
        'varBid': varBid,
        'pctChange': pctChange,
        'bid': bid,
        'ask': ask,
        'timestamp': timestamp,
        'create_date': createDate,
      };
}
