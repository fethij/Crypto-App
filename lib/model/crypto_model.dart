class Crypto {
  int id;
  double price;
  final String symbol, name, slug, image;

  Crypto({this.id, this.symbol, this.name, this.slug, this.price, this.image});

  factory Crypto.fromMap(Map<String, dynamic> json) {
    return Crypto(
      id: json['id'] as int,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      price: json['quote']['USD']['price'] as double,
      slug: json['slug'] as String,
    );
  }
}
