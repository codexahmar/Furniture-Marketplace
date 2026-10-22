import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../domain/models/product.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/custom_button.dart';
import '../widgets/product_image.dart';

/// Product Detail Screen (Screen 3)
class ProductDetailScreen extends StatefulWidget {
  final Product product;
  final VoidCallback onBack;

  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.onBack,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _selectedColorIndex = 0;
  int _quantity = 1;
  late bool _isFavorite;

  final List<Color> _colorOptions = const [
    AppColors.dotGreen,
    AppColors.dotOrange,
    AppColors.dotCoral,
  ];

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.product.isFavorite;
  }

  @override
  void didUpdateWidget(covariant ProductDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.product.id != widget.product.id) {
      _isFavorite = widget.product.isFavorite;
      _quantity = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final int totalPrice = product.price * _quantity;

    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Top App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularIconButton(
                    icon: CupertinoIcons.arrow_left,
                    onTap: widget.onBack,
                  ),
                  CircularIconButton(
                    icon: _isFavorite
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                    onTap: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                    backgroundColor: AppColors.pureBlack,
                    iconColor: Colors.white,
                  ),
                ],
              ),
            ),

            // Color Selector Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_colorOptions.length, (index) {
                final isSelected = _selectedColorIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColorIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(
                              color: _colorOptions[index],
                              width: 1.5,
                            )
                          : Border.all(color: Colors.transparent, width: 1.5),
                    ),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: _colorOptions[index],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 10),

            // Product Showcase with Pedestal and Slider Indicator
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Circular perspective pedestal shadow
                  Positioned(
                    bottom: 40,
                    child: Container(
                      width: 240,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 35,
                            spreadRadius: 2,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black.withValues(alpha: 0.04),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),

                  // Large High-Res Sienna Lounge Chair Image
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 0, 28, 40),
                      child: ProductImage(
                        assetPath: product.assetPath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  // Horizontal 360 / slide indicator pill
                  Positioned(
                    bottom: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            CupertinoIcons.arrow_left_right,
                            size: 13,
                            color: AppColors.pureBlack,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom White Sheet Card
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 30,
                    offset: const Offset(0, -10),
                  ),
                ],
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Floating bag button attached to top-right edge
                  Positioned(
                    top: -24,
                    right: 28,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.pureBlack,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const Icon(
                        CupertinoIcons.bag_fill,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // Bottom sheet content
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 30, 24, 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title
                        Text(
                          product.name,
                          style: AppTypography.detailTitle(),
                        ),
                        const SizedBox(height: 8),

                        // Description
                        Text(
                          product.subtitle,
                          style: AppTypography.bodyMuted(),
                        ),
                        const SizedBox(height: 20),

                        // Price and Quantity Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Price + Discount Pill
                            Row(
                              children: [
                                Text(
                                  '\$${product.price}',
                                  style: AppTypography.priceBold(
                                    fontSize: 24,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 7,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.discountDark,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    product.discount,
                                    style: AppTypography.discountBadge(),
                                  ),
                                ),
                              ],
                            ),

                            // Quantity Selector (- 1 +)
                            Container(
                              height: 38,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceMuted,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      CupertinoIcons.minus,
                                      size: 14,
                                      color: AppColors.pureBlack,
                                    ),
                                    splashRadius: 16,
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(
                                      minWidth: 32,
                                      minHeight: 32,
                                    ),
                                    onPressed: () {
                                      if (_quantity > 1) {
                                        setState(() => _quantity--);
                                      }
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                    ),
                                    child: Text(
                                      '$_quantity',
                                      style: AppTypography.cardTitle(),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      CupertinoIcons.plus,
                                      size: 14,
                                      color: AppColors.pureBlack,
                                    ),
                                    splashRadius: 16,
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(
                                      minWidth: 32,
                                      minHeight: 32,
                                    ),
                                    onPressed: () {
                                      setState(() => _quantity++);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 22),

                        // Main CTA Button
                        CustomButton(
                          text: 'Buy for \$$totalPrice',
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Added $_quantity x ${product.name} to cart!',
                                  style: AppTypography.buttonText(fontSize: 14),
                                ),
                                backgroundColor: AppColors.pureBlack,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
