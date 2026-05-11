import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_card_dex/core/home_screen.dart';
import 'package:provider/provider.dart';
import '../features/collections/presentation/pages/collections_page.dart';
import '../features/collections/presentation/state/collections_provider.dart';
import 'database/isar_instance.dart';
import 'injection_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  Future<void> _init() async {

    // Tarda muy poco así que apenas se llega a ver
    // Por ahora dejo el delayed para que se vea el logo
    await Future.delayed(Duration.zero);


    await IsarInstance.init();
    await initDependencies();

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // El logo centrado
          Center(
            child: Image.asset(
              "images/logo.png",
              width: 200,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                strokeWidth: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}