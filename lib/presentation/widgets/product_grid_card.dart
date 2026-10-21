import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../domain/models/product.dart';
import 'product_image.dart';

/// Reusable Product Grid Card Widget
class ProductGridCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const ProductGridCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Discount Tag (Top Right)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.discountDark,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  product.discount,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Center Chair Content
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 18, 14, 12),
              child: Column(
                children: [
                  // Chair Image
                  Expanded(
                    child: Center(
                      child: ProductImage(
                        assetPath: product.assetPath,
                        fallbackUrl: product.fallbackUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Name
                  Text(
                    product.name,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.pureBlack,
                    ),
                  ),
                  const SizedBox(height: 2),

                  // Price
                  Text(
                    '\$${product.price}',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: AppColors.pureBlack,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Circular Favorite Button
                  GestureDetector(
                    onTap: onFavoriteToggle,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: product.isFavorite
                            ? AppColors.pureBlack
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: product.isFavorite
                            ? null
                            : Border.all(
                                color: const Color(0xFFDCDFE3),
                                width: 1.2,
                              ),
                      ),
                      child: Icon(
                        product.isFavorite
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        size: 15,
                        color: product.isFavorite
                            ? Colors.white
                            : AppColors.pureBlack,
                      ),
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
