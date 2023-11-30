import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul3prak/app/routes/app_routes.dart';

class Accountpage extends StatefulWidget {
  @override
  State<Accountpage> createState() => _AccountPageState();
}

class _AccountPageState extends State<Accountpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 56, 56, 56),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(RoutesClass.getRegisterRoute()),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 100,
                      height: 30,
                      child: Card(
                        child: Text('Register'),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(RoutesClass.getLoginRoute()),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 100,
                      height: 30,
                      child: Card(
                        child: Text('Login'),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(RoutesClass.getLoginRoute()),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 100,
                      height: 30,
                      child: Card(
                        child: Text('Logout'),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(RoutesClass.getTestRoute()),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: 100,
                      height: 30,
                      child: Card(
                        child: Text('Appwrite'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
