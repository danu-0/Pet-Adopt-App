import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pet_adopted_app/components/bottom.dart';
import 'package:pet_adopted_app/components/form.dart';
import 'package:pet_adopted_app/controller/controller.dart';
import 'package:pet_adopted_app/data/api/sercvices.dart';
import 'package:pet_adopted_app/theme/text.dart';
import 'package:pet_adopted_app/ui/HomeScreen/home.dart';
import 'package:pet_adopted_app/ui/auth/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final UserController userController = Get.find();
  final _formkey = GlobalKey<FormState>();
  Service service = Service();

  bool isLoading = false;

  Future<void> loginUser() async {
    if (_formkey.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        final response = await service.loginUser(
            emailController.text, passwordController.text);
        final data = jsonDecode(response.body);

        if (response.statusCode == 200) {
          final user = data['user'];
          userController.setUser(user);
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true);
          await prefs.setString('userName', user['name']);
          await prefs.setString('email', user['email']);

          Get.snackbar(
            'Login Berhasil',
            'Selamat datang, ${user['name']}!',
            backgroundColor: Colors.green.shade100,
            colorText: Colors.black,
          );

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Home()),
            (route) => false,
          );
        } else {
          Get.snackbar(
            'Login Gagal',
            data['message'] ?? 'Terjadi kesalahan',
            backgroundColor: Colors.red.shade100,
            colorText: Colors.black,
          );
        }
      } catch (e) {
        print('Error: $e');
        Get.snackbar(
          'Error',
          'Tidak dapat terhubung ke server.',
          backgroundColor: Colors.orange.shade100,
          colorText: Colors.black,
        );
      } finally {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/material/bg.png'),
                fit: BoxFit.cover)),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Icon(Icons.pets,
                  size: 64, color: Color.fromARGB(255, 103, 63, 188)),
              SizedBox(height: 16),
              Text(
                'Pet Adopted Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              CustomForm(
                desk: 'Email',
                icon: Icons.mail,
                controller: emailController,
                validator: (value) =>
                    value!.isEmpty ? 'Email wajib diisi' : null,
              ),
              SizedBox(height: 16),
              CustomFormP(
                desk: 'Password',
                icon: Icons.lock,
                controller: passwordController,
                validator: (value) =>
                    value!.length < 4 ? 'Minimal 5 karakter' : null,
              ),
              SizedBox(height: 24),
              isLoading
                  ? CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          buton(onPressed: loginUser, text: 'Login'),
                          Gap(20),
                          Text(
                            "Tidak Punya Akun?",
                            style: TextApp.reguler,
                          ),
                          Gap(6),
                          buton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
                              },
                              text: 'Daftar')
                        ],
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
