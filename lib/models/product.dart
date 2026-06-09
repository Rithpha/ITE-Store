class Product {
  final int id;
  final String name;
  final String description;
  final String thumbnail;
  final int price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      price: json['price'] ?? 0,
    );
  }
}
