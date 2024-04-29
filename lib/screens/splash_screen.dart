import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:splash_view/source/presentation/presentation.dart';
import 'package:tap2024/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*body: Center(
        child: Lottie.asset('/assets/Animation - 1712709711403.json'),*/
        body: SplashView(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.blue,
            ]
            ),
          logo: Lottie.asset('assets/tecnm.json',
          height: MediaQuery.of(context).size.height * .5
          ),
          done: Done(LoginScreen()),
          duration: const Duration(milliseconds: 7000),
          bottomLoading: true,
        )
    );
  }
}