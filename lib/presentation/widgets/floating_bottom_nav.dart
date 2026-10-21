import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

/// Reusable Floating Bottom Navigation Bar Widget
class FloatingBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;

  const FloatingBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.pureBlack,
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Active Shopping bag pill
          GestureDetector(
            onTap: () => onIndexChanged(0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: selectedIndex == 0
                    ? AppColors.darkNavPill
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                CupertinoIcons.bag_fill,
                size: 20,
                color: selectedIndex == 0 ? Colors.white : Colors.white60,
              ),
            ),
          ),

          // Heart with count badge
          GestureDetector(
            onTap: () => onIndexChanged(1),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  CupertinoIcons.heart,
                  size: 22,
                  color: selectedIndex == 1 ? Colors.white : Colors.white70,
                ),
                Positioned(
                  right: -6,
                  top: -2,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      '0',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        color: AppColors.pureBlack,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Cart
          GestureDetector(
            onTap: () => onIndexChanged(2),
            child: Icon(
              CupertinoIcons.cart,
              size: 22,
              color: selectedIndex == 2 ? Colors.white : Colors.white70,
            ),
          ),

          // Settings
          GestureDetector(
            onTap: () => onIndexChanged(3),
            child: Icon(
              CupertinoIcons.gear_alt,
              size: 22,
              color: selectedIndex == 3 ? Colors.white : Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
