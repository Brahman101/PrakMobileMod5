import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul3prak/app/modules/home/controllers/account_controller.dart';

class TestAccountView extends StatelessWidget {
  final AccountController _accountController = AccountController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appwrite Account Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16),
            Obx(() {
              return ElevatedButton(
                onPressed: _accountController.isLoading.value
                    ? null
                    : () {
                        _accountController.registerAppWrite(
                          emailController.text,
                          passwordController.text,
                          nameController.text,
                        );
                      },
                style: ElevatedButton.styleFrom(
                  primary:
                      Colors.orange, // Use Colors.orange instead of orangeColor
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  fixedSize: Size(150, 50),
                ),
                child: _accountController.isLoading.value
                    ? CircularProgressIndicator()
                    : Text('Register'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
