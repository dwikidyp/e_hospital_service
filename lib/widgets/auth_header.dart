import 'package:e_hospital_service/constants/app_colors.dart';
import 'package:e_hospital_service/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.favorite_outlined,
            color: AppColors.white,
            size: 36,
          ),
        ),
        const SizedBox(height: 16),
        const Text('e-Hospital', style: AppTextStyles.appTitle),
        const SizedBox(height: 6),
        const Text(
          'Your health, our priority',
          style: AppTextStyles.appSubtitle,
        ),
      ],
    );
  }
}
