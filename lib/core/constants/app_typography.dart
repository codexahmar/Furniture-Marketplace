import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// App Typography Styles
class AppTypography {
  AppTypography._();

  static TextStyle screenTitle({Color color = AppColors.pureBlack}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 28,
      fontWeight: FontWeight.w800,
      color: color,
      letterSpacing: -0.5,
    );
  }

  static TextStyle heroBannerTitle({Color color = Colors.white}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      color: color,
      height: 1.15,
      letterSpacing: -0.8,
    );
  }

  static TextStyle detailTitle({Color color = AppColors.pureBlack}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 22,
      fontWeight: FontWeight.w800,
      color: color,
      letterSpacing: -0.4,
    );
  }

  static TextStyle cardTitle({Color color = AppColors.pureBlack}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle priceBold({
    Color color = AppColors.pureBlack,
    double fontSize = 16,
  }) {
    return GoogleFonts.plusJakartaSans(
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      color: color,
      letterSpacing: -0.3,
    );
  }

  static TextStyle discountBadge({Color color = Colors.white}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle bodyMuted({Color color = AppColors.mutedGray}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: color,
      height: 1.4,
    );
  }

  static TextStyle buttonText({
    Color color = Colors.white,
    double fontSize = 16,
  }) {
    return GoogleFonts.plusJakartaSans(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }
}
