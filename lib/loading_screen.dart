import 'dart:async';
import 'package:cafe_z/const.dart';
import 'package:cafe_z/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _showWelcomeMessage = false;

  @override
  void initState() {
    super.initState();
    // Simulate a delay before opening the HomePage
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AuthPage()));
    });
    // Trigger the animation after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _showWelcomeMessage = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use AnimatedOpacity to animate the welcome message
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _showWelcomeMessage ? 1.0 : 0.0,
              child: const Text(
                'Welcome to Café Z',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Change color as needed
                ),
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'lib/images/black.png', // Change to your app icon path
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            // Define and use the spinkit variable
            const SpinKitFadingCube(
              color: Colors.brown,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
