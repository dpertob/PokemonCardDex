import 'package:flutter/material.dart';
import '../shared/widgets/home_button.dart';
import 'navigation/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokémon Card Dex"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            HomeButton(
              title: "Official Sets",
              icon: Icons.collections_bookmark,
              onTap: () {
                Navigator.push(
                  context,
                  AppRoutes.collections()
                );
              },
            ),
            const SizedBox(height: 12),

            HomeButton(
              title: "My Collection",
              icon: Icons.style,
              onTap: () {
              },
            ),
            const SizedBox(height: 12),

            HomeButton(
              title: "Search For Cards",
              icon: Icons.search,
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}