import 'package:e_hospital_service/constants/app_colors.dart';
import 'package:e_hospital_service/models/user_model.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final UserModel user;
  final Map<String, int> stats;

  const HomeHeader({Key? key, required this.user, required this.stats})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 16,
          left: 20,
          right: 20,
          bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.greeting,
                    style: const TextStyle(fontSize: 13, color: Colors.white70),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user.fullName,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white),
                  )
                ],
              )),
              // Avatar Inisial
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.25),
                    shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    user.initials,
                    style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          // Stats Card
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(14)),
            child: Row(
              children: [
                _StatItem(
                    value: '${stats['upcoming'] ?? 0}', label: 'Upcoming'),
                _Divider(),
                _StatItem(value: '${stats['doctors'] ?? 0}', label: 'Doctors'),
                _Divider(),
                _StatItem(value: '${stats['records'] ?? 0}', label: 'Records')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Colors.white70),
          )
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 32,
      color: AppColors.white.withOpacity(0.3),
      margin: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
}
