import 'package:flutter/material.dart';

class HomeCategoryTile extends StatelessWidget {
  final Widget icon;
  final String title;
  const HomeCategoryTile({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
