import 'package:ai_notes_taker/modules/shared/widgets/colors.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        strokeWidth: 5,
        strokeCap: StrokeCap.round,
        color: AppColors.primary900,
      ),
    );
  }
}
