/// Product Domain Model
class Product {
  final String id;
  final String name;
  final String subtitle;
  final int price;
  final String discount;
  final String category;
  final String assetPath;
  final String fallbackUrl;
  final bool isFavorite;

  const Product({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.discount,
    required this.category,
    required this.assetPath,
    required this.fallbackUrl,
    this.isFavorite = false,
  });

  Product copyWith({
    String? id,
    String? name,
    String? subtitle,
    int? price,
    String? discount,
    String? category,
    String? assetPath,
    String? fallbackUrl,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      category: category ?? this.category,
      assetPath: assetPath ?? this.assetPath,
      fallbackUrl: fallbackUrl ?? this.fallbackUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
