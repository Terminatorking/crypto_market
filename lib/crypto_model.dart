class Crypto {
  String name;
  String symbol;
  double priceUsd;
  double changePercent24Hr;
  
  Crypto({
    required this.name,
    required this.symbol,
    required this.priceUsd,
    required this.changePercent24Hr,
  });

  factory Crypto.fromeMapJson(json) {
    return Crypto(
      name: json["data"]["name"],
      symbol: json["data"]["symbol"],
      priceUsd: json["data"]["priceUsd"],
      changePercent24Hr: json["data"]["changePercent24Hr"],
    );
  }
}
