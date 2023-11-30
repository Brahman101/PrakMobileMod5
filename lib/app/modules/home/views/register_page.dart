import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul3prak/app/modules/home/controllers/auth_controller.dart';
import 'package:modul3prak/app/routes/app_routes.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 56, 56, 56),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Daftar',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.amber),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow))),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.amber),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow))),
              ),
              SizedBox(height: 16),
              Obx(() {
                return ElevatedButton(
                  onPressed: _authController.isLoading.value
                      ? null
                      : () {
                          _authController.registerUser(
                            _emailController.text,
                            _passwordController.text,
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow, // Background color
                    onPrimary: const Color.fromARGB(255, 0, 0, 0), // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Button border radius
                    ),
                    shadowColor: Colors.yellow,
                    elevation: 5,
                  ),
                  child: _authController.isLoading.value
                      ? CircularProgressIndicator()
                      : Text('Register'),
                );
              }),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 58),
                child: Row(
                  children: [
                    Text('Sudah punya akun?, ',
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                    GestureDetector(
                      onTap: () => Get.toNamed(RoutesClass.getLoginRoute()),
                      child: Text(
                        'langsung masuk saja!',
                        style: TextStyle(color: Colors.amber, fontSize: 14),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
