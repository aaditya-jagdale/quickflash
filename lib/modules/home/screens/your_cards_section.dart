import 'package:ai_notes_taker/modules/home/widgets/your_cards_card.dart';
import 'package:ai_notes_taker/modules/shared/widgets/colors.dart';
import 'package:flutter/material.dart';

class YourCardsSection extends StatefulWidget {
  const YourCardsSection({super.key});

  @override
  State<YourCardsSection> createState() => _YourCardsSectionState();
}

class _YourCardsSectionState extends State<YourCardsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.primary900),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 12, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Your cards",
                  style: TextStyle(fontSize: 16, color: AppColors.white),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return YourCardsCard();
              },
            ),
          )
        ],
      ),
    );
  }
}
