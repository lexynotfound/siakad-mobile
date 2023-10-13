import 'package:flutter/material.dart';
import '../../pages/auth/auth_page.dart';
import '../../core/constants/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  /*
    Animation Delayed Splash Screen
   */

  @override
  void initState(){
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => const AuthPage(),
        ),
      ),
    );
  }

  /*
      Import Logo
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
            Images.logo,
            width: 200.0,
          ),
      ),
    );
  }
}