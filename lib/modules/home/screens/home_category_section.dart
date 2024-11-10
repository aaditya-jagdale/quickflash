import 'package:ai_notes_taker/modules/home/widgets/home_category_tile.dart';
import 'package:ai_notes_taker/modules/shared/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCategorySection extends StatefulWidget {
  const HomeCategorySection({super.key});

  @override
  State<HomeCategorySection> createState() => _HomeCategorySectionState();
}

class _HomeCategorySectionState extends State<HomeCategorySection> {
  List<Map<String, dynamic>> categories = [
    {
      "icon": "assets/icons/stars.svg",
      "title": "Generate Cards",
    },
    {
      "icon": "assets/icons/bookmark.svg",
      "title": "Saved\nCards",
    },
    {
      "icon": "assets/icons/fast.svg",
      "title": "Quick Revision",
    },
    {
      "icon": "assets/icons/infinity.svg",
      "title": "Infinity Mode",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          categories.length,
          (index) => HomeCategoryTile(
            icon: SvgPicture.asset(categories[index]['icon']),
            title: categories[index]['title'],
          ),
        ),
      ),
    );
  }
}
