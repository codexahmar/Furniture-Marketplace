import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

/// Reusable Product Image Widget with Local Asset and Network Fallbacks
class ProductImage extends StatelessWidget {
  final String assetPath;
  final String fallbackUrl;
  final BoxFit fit;

  const ProductImage({
    super.key,
    required this.assetPath,
    required this.fallbackUrl,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
          fallbackUrl,
          fit: fit,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.forestGreen,
                ),
              ),
            );
          },
          errorBuilder: (context, netError, netStackTrace) {
            return Container(
              color: const Color(0xFFF0F1F3),
              child: const Center(
                child: Icon(
                  CupertinoIcons.cube_box,
                  size: 40,
                  color: AppColors.mutedGray,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
