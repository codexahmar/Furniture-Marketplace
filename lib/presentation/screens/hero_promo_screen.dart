import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../domain/models/product.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/custom_button.dart';
import '../widgets/product_image.dart';

/// Promotional Hero Screen (Screen 2)
class HeroPromoScreen extends StatelessWidget {
  final Product heroProduct;
  final VoidCallback onBack;
  final VoidCallback onShopMore;
  final VoidCallback onSelectHeroProduct;

  const HeroPromoScreen({
    super.key,
    required this.heroProduct,
    required this.onBack,
    required this.onShopMore,
    required this.onSelectHeroProduct,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: AppColors.forestGreen,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Top Bar with translucent circular buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularIconButton(
                    icon: CupertinoIcons.arrow_left,
                    onTap: onBack,
                    backgroundColor: Colors.white.withValues(alpha: 0.15),
                    iconColor: Colors.white,
                    hasShadow: false,
                  ),
                  CircularIconButton(
                    icon: CupertinoIcons.bag,
                    badgeText: '1',
                    badgeColor: Colors.white,
                    badgeTextColor: AppColors.forestGreen,
                    onTap: onSelectHeroProduct,
                    backgroundColor: Colors.white.withValues(alpha: 0.15),
                    iconColor: Colors.white,
                    hasShadow: false,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // "Exclusive" tag with sofa/armchair icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.sparkles,
                    size: 14,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Exclusive',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withValues(alpha: 0.9),
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Bold Headline: "Make Space For Something Better"
              Text(
                'Make Space For\nSomething\nBetter',
                textAlign: TextAlign.center,
                style: AppTypography.heroBannerTitle(),
              ),
              const SizedBox(height: 28),

              // Featured White Card with Green Velvet Chair
              Expanded(
                child: GestureDetector(
                  onTap: onSelectHeroProduct,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        ),
                      ],
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        // Discount Tag on top right
                        Positioned(
                          top: 18,
                          right: 18,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.discountDark,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              heroProduct.discount,
                              style: AppTypography.discountBadge(),
                            ),
                          ),
                        ),

                        // Center Chair and Info
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            // Chair Image
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: ProductImage(
                                  assetPath: heroProduct.assetPath,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),

                            // Name
                            Text(
                              heroProduct.name,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.pureBlack,
                              ),
                            ),
                            const SizedBox(height: 4),

                            // Price
                            Text(
                              '\$${heroProduct.price}',
                              style: AppTypography.priceBold(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 28),
                          ],
                        ),

                        // Floating black cart button at bottom center of the card
                        Positioned(
                          bottom: -20,
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: const BoxDecoration(
                              color: AppColors.pureBlack,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: const Icon(
                              CupertinoIcons.bag_fill,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 38),

              // Bottom Full-width White Button: "Shop More"
              CustomButton(
                text: 'Shop More',
                onPressed: onShopMore,
                backgroundColor: Colors.white,
                textColor: AppColors.pureBlack,
              ),
              SizedBox(height: bottomPadding > 0 ? bottomPadding + 10 : 24),
            ],
          ),
        ),
      ),
    );
  }
}
