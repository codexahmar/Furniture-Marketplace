import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../data/repositories/mock_product_repository.dart';
import 'catalog_screen.dart';
import 'hero_promo_screen.dart';
import 'product_detail_screen.dart';

/// Main Navigation Shell with PageView and Interactive Switcher
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
  int _currentPage = 0;

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
    final detailProduct = widget.repository.getDetailProduct();

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              CatalogScreen(
                products: catalogProducts,
                onProductSelected: (product) => _navigateToPage(2),
                onOpenHeroPromo: () => _navigateToPage(1),
              ),
              HeroPromoScreen(
                heroProduct: heroProduct,
                onBack: () => _navigateToPage(0),
                onShopMore: () => _navigateToPage(0),
                onSelectHeroProduct: () => _navigateToPage(2),
              ),
              ProductDetailScreen(
                product: detailProduct,
                onBack: () => _navigateToPage(0),
              ),
            ],
          ),
          // Top subtle interactive screen switcher pill for easy testing across the 3 screens
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: (_currentPage == 1 ? Colors.white : AppColors.pureBlack)
                      .withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildScreenPill('Catalog', 0),
                    const SizedBox(width: 4),
                    _buildScreenPill('Hero', 1),
                    const SizedBox(width: 4),
                    _buildScreenPill('Detail', 2),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScreenPill(String title, int pageIndex) {
    final bool isSelected = _currentPage == pageIndex;
    final bool isDarkBackground = _currentPage == 1;

    return GestureDetector(
      onTap: () => _navigateToPage(pageIndex),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDarkBackground ? Colors.white : AppColors.pureBlack)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected
                ? (isDarkBackground ? AppColors.pureBlack : Colors.white)
                : (isDarkBackground
                    ? Colors.white.withValues(alpha: 0.7)
                    : AppColors.pureBlack.withValues(alpha: 0.6)),
          ),
        ),
      ),
    );
  }
}
