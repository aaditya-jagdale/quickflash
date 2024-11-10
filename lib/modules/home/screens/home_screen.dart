import 'package:ai_notes_taker/modules/home/screens/home_category_section.dart';
import 'package:ai_notes_taker/modules/home/screens/your_cards_section.dart';
import 'package:ai_notes_taker/modules/home/widgets/home_category_tile.dart';
import 'package:ai_notes_taker/modules/home/widgets/your_cards_card.dart';
import 'package:ai_notes_taker/modules/shared/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> colors = <Color>[
    Color(0XFFFFF176),
    Color(0XFFC8E6C9),
    Color(0XFFFFD180),
    Color(0XFF81D4FA),
    Color(0XFFCE93D8),
    Color(0XFFFFAB91),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        titleSpacing: 10,
        title: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/pen.svg",
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(width: 8),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Quick',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      fontSize: 24,
                    ),
                  ),
                  TextSpan(
                    text: 'Flash',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary900,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: const [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.secondary,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.primary900,
            child: Column(
              children: [
                //Search box
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.15),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/search.svg",
                              fit: BoxFit.scaleDown,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Search for any subject',
                              style: TextStyle(
                                color: AppColors.white800,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      //Home Categories
                      const HomeCategorySection(),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
                //Your cards
                YourCardsSection(),
              ],
            ),
          ),

          //For you
          //Exam prep cards
        ],
      ),
    );
  }
}
