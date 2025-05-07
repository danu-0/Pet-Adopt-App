import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controller/controller.dart';
import './ui/auth/register.dart';
import './ui/splash/splash.dart';

void main() async {
  Get.put(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: SplashScreen(),
      routes: {
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
