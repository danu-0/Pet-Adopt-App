import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import '/components/bottom.dart';
import '/components/form.dart';
import '/data/api/sercvices.dart';
import '/theme/text.dart';
import '/ui/auth/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final Service service = Service();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void handleRegister() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        await service.createUser(
          nameController.text,
          emailController.text,
          passwordController.text,
        );

        Get.snackbar(
          'Registrasi Berhasil',
          'Akun berhasil dibuat!',
          backgroundColor: Colors.green.shade100,
          colorText: Colors.black,
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      } catch (e) {
        Get.snackbar(
          'Registrasi Gagal',
          'Terjadi kesalahan: $e',
          backgroundColor: Colors.red.shade100,
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
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/material/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.pets,
                size: 64, color: Color.fromARGB(255, 103, 63, 188)),
            const SizedBox(height: 16),
            const Text(
              'Pet Adopted Daftar',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomForm(
                    desk: 'Nama Lengkap',
                    icon: Icons.person,
                    controller: nameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Nama wajib diisi' : null,
                  ),
                  const Gap(16),
                  CustomForm(
                    desk: 'Email',
                    icon: Icons.email,
                    controller: emailController,
                    validator: (value) =>
                        value!.isEmpty ? 'Email wajib diisi' : null,
                  ),
                  const Gap(16),
                  CustomFormP(
                    desk: 'Password',
                    icon: Icons.lock,
                    controller: passwordController,
                    validator: (value) =>
                        value!.length < 4 ? 'Minimal 5 karakter' : null,
                  ),
                  const Gap(24),
                ],
              ),
            ),
            isLoading
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        buton(onPressed: handleRegister, text: 'Daftar'),
                        const Gap(20),
                        Text(
                          "Sudah punya akun?",
                          style: TextApp.reguler,
                        ),
                        const Gap(6),
                        buton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          text: 'Login',
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
