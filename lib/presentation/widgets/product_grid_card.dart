import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../domain/models/product.dart';
import 'product_image.dart';

/// Reusable Product Grid Card Widget matching Dribbble reference:
/// Pinned discount badge top-right, chair image, product name, price,
/// and favorite button pinned at the bottom end of each card.
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
          color: const Color.fromARGB(255, 243, 244, 246),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // 1. Discount Tag (Top Right)
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

            // 2. Chair Content (Image, Name, Price)
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 16, 14, 48),
                child: Column(
                  children: [
                    // Chair Image
                    Expanded(
                      child: Center(
                        child: ProductImage(
                          assetPath: product.assetPath,
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
                  ],
                ),
              ),
            ),

            // 3. Circular Favorite Button (Pinned at the end of each card)
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: onFavoriteToggle,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: product.isFavorite
                          ? AppColors.pureBlack
                          : const Color(0xFFF0F1F3),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      product.isFavorite
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      size: 16,
                      color: product.isFavorite ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
