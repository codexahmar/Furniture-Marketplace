import '../../domain/models/product.dart';

/// Product Repository Interface
abstract class ProductRepository {
  List<Product> getCatalogProducts();
  Product getHeroProduct();
  Product getDetailProduct();
}

/// Mock Implementation providing data matching the design specification
class MockProductRepository implements ProductRepository {
  @override
  List<Product> getCatalogProducts() {
    return const [
      Product(
        id: '1',
        name: 'Orris',
        subtitle: 'Tufted Velvet Armchair',
        price: 320,
        discount: '-5%',
        category: 'Lounge',
        assetPath: 'assets/images/chair_orris_small.png',
        fallbackUrl:
            'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=600&auto=format&fit=crop&q=80',
        isFavorite: true,
      ),
      Product(
        id: '2',
        name: 'Elvo',
        subtitle: 'Caramel Accent Chair',
        price: 500,
        discount: '-10%',
        category: 'Lounge',
        assetPath: 'assets/images/chair_elvo.png',
        fallbackUrl:
            'https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?w=600&auto=format&fit=crop&q=80',
        isFavorite: false,
      ),
      Product(
        id: '3',
        name: 'Mollis',
        subtitle: 'Cognac Leather Wingback',
        price: 320,
        discount: '-10%',
        category: 'Lounge',
        assetPath: 'assets/images/chair_mollis.png',
        fallbackUrl:
            'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?w=600&auto=format&fit=crop&q=80',
        isFavorite: false,
      ),
      Product(
        id: '4',
        name: 'Kivi',
        subtitle: 'Sage Tufted Lounge',
        price: 245,
        discount: '-5%',
        category: 'Lounge',
        assetPath: 'assets/images/chair_kivi.png',
        fallbackUrl:
            'https://images.unsplash.com/photo-1580481077195-c3f25c7e14f8?w=600&auto=format&fit=crop&q=80',
        isFavorite: false,
      ),
    ];
  }

  @override
  Product getHeroProduct() {
    return const Product(
      id: 'hero',
      name: 'Orris Chair',
      subtitle: 'Exclusive modern lounge series',
      price: 320,
      discount: '-5%',
      category: 'Exclusive',
      assetPath: 'assets/images/chair_orris.png',
      fallbackUrl:
          'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800&auto=format&fit=crop&q=80',
      isFavorite: false,
    );
  }

  @override
  Product getDetailProduct() {
    return const Product(
      id: 'detail',
      name: 'Sienna Lounge Chair',
      subtitle:
          'A sculptural, ergonomic lounge chair designed for modern relaxation spaces.',
      price: 550,
      discount: '-5%',
      category: 'Lounge',
      assetPath: 'assets/images/chair_sienna.png',
      fallbackUrl:
          'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800&auto=format&fit=crop&q=80',
      isFavorite: true,
    );
  }
}
