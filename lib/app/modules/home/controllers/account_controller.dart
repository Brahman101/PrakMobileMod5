import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul3prak/app/modules/home/controllers/client_controller.dart';
import 'package:modul3prak/app/modules/home/views/home_view.dart';
import 'package:modul3prak/app/routes/app_routes.dart';

class AccountController extends ClientController {
  Account? account;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
// appwrite
    account = Account(client);
  }

  Future createAccount(Map map) async {
    try {
      if (map['email'] == null || map['password'] == null) {
        throw "Email and password cannot be null";
      }

      final result = await account!.create(
        userId: map['userId'],
        email: map['email'],
        password: map['password'],
        name: map['name'],
      );
      print("AccountController:: createAccount $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future createEmailSession(Map map) async {
    try {
      final result = await account!.createEmailSession(
        email: map['email'],
        password: map['password'],
      );
      print("AccountController:: createEmailSession $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Account",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  Future<void> registerAppWrite(
      String email, String password, String name) async {
    try {
      isLoading.value = true;
      final result = await createAccount({
        'userId': ID.unique(),
        'email': email,
        'password': password,
        'name': name,
      });
      print(result);
      Get.snackbar('Success', 'Registration successful',
          backgroundColor: Colors.green);
      Get.toNamed(RoutesClass.home);
    } catch (error) {
      Get.snackbar('Error', 'Registration failed', backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
