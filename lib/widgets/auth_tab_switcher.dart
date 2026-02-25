import 'package:e_hospital_service/constants/app_colors.dart';
import 'package:e_hospital_service/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthTabSwitcher extends StatelessWidget {
  final bool isLoginSelected;
  final VoidCallback onLoginTap;
  final VoidCallback onSignUpTap;

  const AuthTabSwitcher({
    Key? key,
    required this.isLoginSelected,
    required this.onLoginTap,
    required this.onSignUpTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.tabUnselected,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _TabItem(
            label: 'Login',
            isSelected: isLoginSelected,
            onTap: onLoginTap,
          ),
          _TabItem(
            label: 'Sign Up',
            isSelected: !isLoginSelected,
            onTap: onSignUpTap,
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              label,
              style: isSelected
                  ? AppTextStyles.tabSelected
                  : AppTextStyles.tabUnselected,
            ),
          ),
        ),
      ),
    );
  }
}
