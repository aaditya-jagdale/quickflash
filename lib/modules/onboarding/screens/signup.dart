import 'package:ai_notes_taker/modules/home/screens/home_screen.dart';
import 'package:ai_notes_taker/modules/shared/widgets/colors.dart';
import 'package:ai_notes_taker/modules/shared/widgets/custom_buttons.dart';
import 'package:ai_notes_taker/modules/shared/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SupabaseClient supabase = Supabase.instance.client;
  bool isLoading = false;

  Future _googleSignIn() async {
    const webClientId =
        '23190246988-j8olbtvgq0ka8cd8qp5rm9eo7r3cabru.apps.googleusercontent.com';
    const iosClientId =
        '23190246988-e93kn4uugccs40cft7f68prs511br4r3.apps.googleusercontent.com';
    setState(() {
      isLoading = true;
    });

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    await googleSignIn.signIn().then((response) async {
      setState(() {
        isLoading = false;
      });
      final googleAuth = await response!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }

      supabase
          .from("users")
          .upsert({
            "id": response.id,
            "name": response.displayName,
            "email": response.email,
            "profile_picture": response.photoUrl,
          }, ignoreDuplicates: true)
          .select()
          .then((_) {
            debugPrint(
                "---------------------User added to database: $response");
          });

      supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }).onError((error, stackTrace) {
      setState(() {
        isLoading = false;
      });
      throw error!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
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
                ],
              ),
            ),
          ),
          Animate(
            effects: const [
              SlideEffect(
                begin: Offset(0, 1),
                end: Offset(0, 0),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  if (isLoading) const CustomProgressIndicator(),
                  if (!isLoading)
                    CustomPrimaryButton(
                      title: 'Signup',
                      btnIcon: SvgPicture.asset("assets/icons/google.svg"),
                      onTap: () => _googleSignIn(),
                    ),
                  const SizedBox(height: 10),
                  RichText(
                    text: const TextSpan(
                      text: 'First 5 decks are absolutely ',
                      style: TextStyle(
                        color: AppColors.black500,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'FREE!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.black500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
