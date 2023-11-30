import 'package:appwrite/appwrite.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul3prak/app/modules/home/controllers/account_controller.dart';
import 'package:modul3prak/app/modules/home/views/login_page%20.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AccountController accountController = Get.put(AccountController());
  RxBool isLoading = false.obs;
  Future<void> registerUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Success', 'Registration successful',
          backgroundColor: Colors.green);
      Get.off(LoginPage()); //Navigate ke Login Page
    } catch (error) {
      Get.snackbar('Error', 'Registration failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar('Success', 'Login successful',
          backgroundColor: Colors.green);

      return true;
    } catch (error) {
      Get.snackbar('Error', 'Login failed: $error',
          backgroundColor: Colors.red);

      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> registerUserWithAppwrite(
      String email, String password, String name) async {
    try {
      isLoading.value = true;

      // Assuming you have an instance of AccountController
      final accountController = AccountController();

      final result = await accountController.createAccount({
        'userId': ID.unique(),
        'email': email,
        'password': password,
        'name': name,
      });
      print(result);
      Get.snackbar('Success', 'Registration successful',
          backgroundColor: Colors.green);
      Get.off(LoginPage()); // Navigate to Login Page
    } catch (error) {
      Get.snackbar('Error', 'Registration failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    void logout() async {
      await _auth.signOut();
      Get.offAll(LoginPage());
    }
  }
}
