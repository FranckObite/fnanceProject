import 'package:flutter/material.dart';

import 'connexion.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashnavig();
  }

  splashnavig() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: ((context) => const ConnexionPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Image.asset(
          "images/Money__1_-removebg-preview.png",
          width: 400,
          height: 400,
        ),
      )),
    );
  }
}
