import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../domain/models/product.dart';
import '../widgets/category_pill.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/floating_bottom_nav.dart';
import '../widgets/product_grid_card.dart';

/// Catalog Screen (Screen 1)
class CatalogScreen extends StatefulWidget {
  final List<Product> products;
  final ValueChanged<Product> onProductSelected;
  final VoidCallback onOpenHeroPromo;

  const CatalogScreen({
    super.key,
    required this.products,
    required this.onProductSelected,
    required this.onOpenHeroPromo,
  });

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String _selectedCategory = 'Lounge';
  final List<String> _categories = const ['Lounge', 'Office', 'Dining', 'Rocking'];
  late List<Product> _products;
  int _navIndex = 0;

  @override
  void initState() {
    super.initState();
    _products = List.from(widget.products);
  }

  void _toggleFavorite(int index) {
    setState(() {
      _products[index] = _products[index].copyWith(
        isFavorite: !_products[index].isFavorite,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: Stack(
        children: [
          // Scrollable Content
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: topPadding + 44,
                left: 20,
                right: 20,
                bottom: 110,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  _buildHeader(),
                  const SizedBox(height: 18),

                  // Search Bar
                  _buildSearchBar(),
                  const SizedBox(height: 18),

                  // Categories Horizontal Bar
                  _buildCategories(),
                  const SizedBox(height: 22),

                  // 2-Column Product Grid
                  _buildProductGrid(),
                ],
              ),
            ),
          ),

          // Floating Bottom Navigation Bar
          Positioned(
            left: 24,
            right: 24,
            bottom: 24,
            child: FloatingBottomNav(
              selectedIndex: _navIndex,
              onIndexChanged: (index) {
                setState(() => _navIndex = index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Catalog',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppColors.pureBlack,
            letterSpacing: -0.5,
          ),
        ),
        // Notification bell with red badge
        CircularIconButton(
          icon: CupertinoIcons.bell,
          onTap: widget.onOpenHeroPromo,
          badgeText: '',
          badgeColor: AppColors.badgeRed,
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.search,
            size: 20,
            color: AppColors.mutedGray,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Search',
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.mutedGray,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Icon(
            CupertinoIcons.slider_horizontal_3,
            size: 20,
            color: AppColors.pureBlack,
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: _categories.map((category) {
          final isSelected = category == _selectedCategory;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CategoryPill(
              label: category,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  _selectedCategory = category;
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        final product = _products[index];
        return ProductGridCard(
          product: product,
          onTap: () => widget.onProductSelected(product),
          onFavoriteToggle: () => _toggleFavorite(index),
        );
      },
    );
  }
}
