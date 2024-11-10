import 'package:ai_notes_taker/modules/home/screens/home_category_section.dart';
import 'package:ai_notes_taker/modules/home/screens/profile_screen.dart';
import 'package:ai_notes_taker/modules/home/screens/your_cards_section.dart';
import 'package:ai_notes_taker/modules/onboarding/screens/signup.dart';
import 'package:ai_notes_taker/modules/search/screen/search_screen.dart';
import 'package:ai_notes_taker/modules/shared/widgets/colors.dart';
import 'package:ai_notes_taker/modules/shared/widgets/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  final User? _user = Supabase.instance.client.auth.currentUser;
  String? profilePicture;
  // List<Color> colors = <Color>[
  //   Color(0XFFFFF176),
  //   Color(0XFFC8E6C9),
  //   Color(0XFFFFD180),
  //   Color(0XFF81D4FA),
  //   Color(0XFFCE93D8),
  //   Color(0XFFFFAB91),
  // ];

  @override
  void initState() {
    super.initState();
    Supabase.instance.client
        .from('users')
        .select('profile_picture')
        .eq('id', _user!.id)
        .select()
        .then(
          (data) => {
            if (data.isNotEmpty)
              {
                setState(() {
                  profilePicture = data.first['profile_picture'] as String;
                })
              }
          },
        );
  }

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
        actions: [
          GestureDetector(
            onTap: () {
              upSlideTransition(context, const ProfileScreen());
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.secondary,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(profilePicture ?? ''),
              ),
            ),
          ),
          const SizedBox(width: 10),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SearchScreen(),
                            ),
                          );
                        },
                        child: Hero(
                          tag: 'search-box',
                          child: Material(
                            child: Container(
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
                                  const Expanded(
                                    child: TextField(
                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: 'Search for any subject',
                                        hintStyle: TextStyle(
                                          color: AppColors.white800,
                                          fontFamily: 'inter',
                                          fontSize: 16,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                const YourCardsSection(),
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
