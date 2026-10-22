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
        name: 'Strandmon',
        subtitle: 'Tufted Velvet Wingback',
        price: 320,
        discount: '-5%',
        category: 'Lounge',
        assetPath: 'assets/images/chair1.png',
        isFavorite: true,
      ),
      Product(
        id: '2',
        name: 'Chesterfield',
        subtitle: 'Tufted Leather Club Chair',
        price: 490,
        discount: '-10%',
        category: 'Lounge',
        assetPath: 'assets/images/chair2.png',
        isFavorite: false,
      ),
      Product(
        id: '3',
        name: 'Nordvalla',
        subtitle: 'Indigo Woven Wingback',
        price: 285,
        discount: '-5%',
        category: 'Lounge',
        assetPath: 'assets/images/chair3.png',
        isFavorite: false,
      ),
      Product(
        id: '4',
        name: 'Flora Shell',
        subtitle: 'Emerald Fluted Velvet Chair',
        price: 360,
        discount: '-15%',
        category: 'Lounge',
        assetPath: 'assets/images/chair4.png',
        isFavorite: false,
      ),
    ];
  }

  @override
  Product getHeroProduct() {
    return const Product(
      id: 'hero',
      name: 'Flora Shell Chair',
      subtitle: 'Exclusive modern lounge series',
      price: 360,
      discount: '-15%',
      category: 'Exclusive',
      assetPath: 'assets/images/chair4.png',
      isFavorite: false,
    );
  }

  @override
  Product getDetailProduct() {
    return const Product(
      id: 'detail',
      name: 'Flora Shell Chair',
      subtitle:
          'A sculptural, ergonomic lounge chair designed with fluted emerald velvet upholstery and tapered brass legs.',
      price: 360,
      discount: '-15%',
      category: 'Lounge',
      assetPath: 'assets/images/chair4.png',
      isFavorite: true,
    );
  }
}
