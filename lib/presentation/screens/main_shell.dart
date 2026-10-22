import 'package:flutter/material.dart';
import '../../domain/models/product.dart';
import '../../data/repositories/mock_product_repository.dart';
import 'catalog_screen.dart';
import 'hero_promo_screen.dart';
import 'product_detail_screen.dart';

/// Main Navigation Shell with PageView
class MainNavigationShell extends StatefulWidget {
  final ProductRepository repository;

  const MainNavigationShell({
    super.key,
    required this.repository,
  });

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  late final PageController _pageController;
  Product? _selectedProduct;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final catalogProducts = widget.repository.getCatalogProducts();
    final heroProduct = widget.repository.getHeroProduct();
    final detailProduct = _selectedProduct ?? widget.repository.getDetailProduct();

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        children: [
          CatalogScreen(
            products: catalogProducts,
            onProductSelected: (product) {
              setState(() {
                _selectedProduct = product;
              });
              _navigateToPage(2);
            },
            onOpenHeroPromo: () => _navigateToPage(1),
          ),
          HeroPromoScreen(
            heroProduct: heroProduct,
            onBack: () => _navigateToPage(0),
            onShopMore: () => _navigateToPage(0),
            onSelectHeroProduct: () {
              setState(() {
                _selectedProduct = heroProduct;
              });
              _navigateToPage(2);
            },
          ),
          ProductDetailScreen(
            product: detailProduct,
            onBack: () => _navigateToPage(0),
          ),
        ],
      ),
    );
  }
}
