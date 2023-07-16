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
      name: json["name"],
      symbol: json["symbol"],
      priceUsd: double.parse(json["priceUsd"]),
      changePercent24Hr: double.parse(json["changePercent24Hr"]),
    );
  }
}
