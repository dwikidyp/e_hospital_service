import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle appTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle appSubtitle = TextStyle(
    fontSize: 13,
    color: AppColors.white,
  );

  static const TextStyle tabSelected = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static const TextStyle tabUnselected = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.tabUnselectedText,
  );

  static const TextStyle inputLabel = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle inputHint = TextStyle(
    fontSize: 14,
    color: AppColors.textHint,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    letterSpacing: 0.5,
  );

  static const TextStyle forgotPassword = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  static const TextStyle rememberMe = TextStyle(
    fontSize: 13,
    color: AppColors.textPrimary,
  );

  static const TextStyle orDivider = TextStyle(
    fontSize: 13,
    color: AppColors.textSecondary,
  );

  static const TextStyle demoButton = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle footerText = TextStyle(
    fontSize: 11,
    color: AppColors.textSecondary,
  );

  static const TextStyle footerLink = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
}
