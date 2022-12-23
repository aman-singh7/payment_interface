import 'package:flutter/material.dart';

class PromotionData extends StatelessWidget {
  const PromotionData({required this.promotions, super.key});

  final List<Map<String, dynamic>> promotions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: promotions.map((e) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: e['color'] as Color?,
                      child: Icon(
                        e['icon'] as IconData,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      e['title'] as String,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
