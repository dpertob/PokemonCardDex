import 'package:flutter/material.dart';


class HomeButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const HomeButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 90,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onTap,
        child: Row(
          children: [
            Icon(icon, size: 32),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}