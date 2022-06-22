// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:devaseva_app/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 220.0,
              width: 220.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/DevaSeva_Logo.jpg'),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              child: Text(
                "Welcome To Devaseva",
                style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Poppins"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
