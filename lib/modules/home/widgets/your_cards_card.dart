import 'package:ai_notes_taker/modules/shared/widgets/colors.dart';
import 'package:flutter/material.dart';

class YourCardsCard extends StatefulWidget {
  const YourCardsCard({super.key});

  @override
  State<YourCardsCard> createState() => _YourCardsCardState();
}

class _YourCardsCardState extends State<YourCardsCard> {
  String title = "Basics of calculus";
  String subject = "History";
  int cards = 24;
  int duration = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 220,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.primary200,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              height: 1.2,
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            "$subject • $cards cards • $duration min",
            style: const TextStyle(
              height: 1.2,
              color: AppColors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
