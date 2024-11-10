import 'package:ai_notes_taker/modules/onboarding/screens/splash_screen.dart';
import 'package:ai_notes_taker/modules/shared/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON']!,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Flash',
      theme: ThemeData(
        fontFamily: 'inter',
        scaffoldBackgroundColor: AppColors.white200,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary900),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
