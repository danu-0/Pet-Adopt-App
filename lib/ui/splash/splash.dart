import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '/theme/colour.dart';
import '/theme/text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../HomeScreen/home.dart';
import '../auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Home()),
      );
    } else {}
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/material/bg.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.pets,
              size: 100,
              color: baseColour,
            ),
            Gap(40),
            Text(
              'Selamat Datang di Pet Adopted',
              style: TextApp.h1,
            ),
            Gap(10),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                );
              },
              child: Container(
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    'Cari Peliharaan',
                    style: TextW.h2,
                  ),
                ),
                decoration: BoxDecoration(
                  color: baseColour,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
