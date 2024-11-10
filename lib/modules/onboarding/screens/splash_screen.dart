import 'package:ai_notes_taker/modules/home/screens/home_screen.dart';
import 'package:ai_notes_taker/modules/onboarding/screens/signup.dart';
import 'package:ai_notes_taker/modules/shared/widgets/colors.dart';
import 'package:ai_notes_taker/modules/shared/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    supabase.auth.onAuthStateChange.listen((state) {
      if (state.session!.user.id.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignupScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                text: 'Quick',
                style: TextStyle(
                  color: AppColors.primary900,
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  fontFamily: 'inter',
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Flash',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      fontFamily: 'inter',
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Flash cards faster than ever",
              style: TextStyle(color: AppColors.black600),
            ),
            const SizedBox(height: 50),
            const CustomProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
