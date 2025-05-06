import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adopted_app/controller/controller.dart';
import 'package:pet_adopted_app/ui/auth/register.dart';
import 'package:pet_adopted_app/ui/splash/splash.dart';

void main() {
  Get.put(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
