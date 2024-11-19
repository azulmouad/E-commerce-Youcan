import 'package:flutter/material.dart';

import '../helpers/assets.dart';
import '../helpers/colors.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => const HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimary,
      body: Center(
        child: Image(
          image: AssetImage(kIcon),
          width: 150,
        ),
      ),
    );
  }
}
