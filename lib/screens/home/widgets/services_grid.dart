import 'package:flutter/material.dart';

class ServiceItem {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const ServiceItem(
      {required this.label,
      required this.icon,
      required this.color,
      this.onTap});
}

class ServicesGrid extends StatelessWidget {
  final List<ServiceItem> services;
  const ServicesGrid({Key? key, required this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Services',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A2E)),
        ),
        const SizedBox(
          height: 14,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: services.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 1.1),
          itemBuilder: (context, index) {
            return _ServiceCard(item: services[index]);
          },
        )
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final ServiceItem item;
  const _ServiceCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                  color: item.color, borderRadius: BorderRadius.circular(14)),
              child: Icon(
                item.icon,
                color: Colors.white,
                size: 26,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              item.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A1A2E)),
            )
          ],
        ),
      ),
    );
  }
}
