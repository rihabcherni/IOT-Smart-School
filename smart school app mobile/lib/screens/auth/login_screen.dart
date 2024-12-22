import 'package:flutter/material.dart';
import 'package:smart_school/widgets/CustomElevatedButton.dart';
import 'package:animate_do/animate_do.dart';
import 'package:smart_school/widgets/header_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: const HeaderAuth(
                imageAssetPath: 'assets/backlogin.png',
                height: 140,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FadeInUp(
                duration: const Duration(milliseconds: 1200),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Fade in Login title
                        FadeInUp(
                          duration: const Duration(milliseconds: 1600),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 17, 171),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1800),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 0, 17, 171),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Fade in Password TextField
                        FadeInUp(
                          duration: const Duration(milliseconds: 2000),
                          child: TextField(
                            controller: passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 0, 17, 171),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: const Color.fromARGB(255, 0, 17, 171),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Fade in Login Button
                        FadeInUp(
                          duration: const Duration(milliseconds: 2200),
                          child: SizedBox(
                            width: double.infinity,
                            child: CustomElevatedButton(
                              onPressed: () {
                                if (emailController.text == 'admin@gmail.com' &&
                                    passwordController.text == 'admin123') {
                                  Navigator.pushReplacementNamed(
                                      context, '/adminDashboard');
                                } else if (emailController.text ==
                                        'rihab@gmail.com' &&
                                    passwordController.text == 'rihab123') {
                                  Navigator.pushReplacementNamed(
                                      context, '/home');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Invalid credentials!'),
                                    ),
                                  );
                                }
                              },
                              text: 'Login',
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Fade in Register text row
                        FadeInUp(
                          duration: const Duration(milliseconds: 2400),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 120, 120, 120),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/register');
                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 17, 171)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
