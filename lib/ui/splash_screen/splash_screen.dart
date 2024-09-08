import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/shared/auth_provider.dart';
import 'package:todo/ui/home/home_screen.dart';
import 'package:todo/ui/login/login_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "Splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
     const Duration(milliseconds: 2500),
          () {
        CheckAutoLogin();
      },
    );
    return Scaffold(
      body: Center(child: Image.asset("assets/images/logo_splash.png").animate().fade(
        duration: const Duration(milliseconds: 2500),
        begin: 0,
        end: 1,
      )),
    );
  }

  CheckAutoLogin() async {
    Authprovider provider = Provider.of<Authprovider>(context, listen: false);
    if (provider.isFirebaseUserLogIn()) {
      await provider.retrieveDatabaseUserData();
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }
}
