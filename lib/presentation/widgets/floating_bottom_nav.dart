import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';

/// Reusable Floating Bottom Navigation Bar Widget matching Dribbble reference:
/// Consists of a freestanding circular dark button on the left (Shopping bag)
/// and a freestanding white pill container on the right (Favorites with count, Cart, Settings).
class FloatingBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;
  final int favoritesCount;

  const FloatingBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
    this.favoritesCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 1. Freestanding Left Circular Black Button
        GestureDetector(
          onTap: () => onIndexChanged(0),
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.pureBlack,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.18),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Center(
              child: Icon(
                CupertinoIcons.bag_fill,
                size: 22,
                color: Colors.white,
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // 2. Freestanding Right White Pill Container
        Expanded(
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Heart Icon with count "0"
                GestureDetector(
                  onTap: () => onIndexChanged(1),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        selectedIndex == 1
                            ? CupertinoIcons.heart_fill
                            : CupertinoIcons.heart,
                        size: 20,
                        color: AppColors.pureBlack,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$favoritesCount',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.pureBlack,
                        ),
                      ),
                    ],
                  ),
                ),

                // Bag / Store Icon
                GestureDetector(
                  onTap: () => onIndexChanged(2),
                  child: Icon(
                    selectedIndex == 2
                        ? CupertinoIcons.bag_fill
                        : CupertinoIcons.bag,
                    size: 20,
                    color: selectedIndex == 2
                        ? AppColors.pureBlack
                        : AppColors.pureBlack.withValues(alpha: 0.85),
                  ),
                ),

                // Settings Gear Icon
                GestureDetector(
                  onTap: () => onIndexChanged(3),
                  child: Icon(
                    selectedIndex == 3
                        ? CupertinoIcons.gear_alt_fill
                        : CupertinoIcons.gear_alt,
                    size: 20,
                    color: selectedIndex == 3
                        ? AppColors.pureBlack
                        : AppColors.pureBlack.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
