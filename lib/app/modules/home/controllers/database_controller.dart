import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul3prak/app/modules/home/controllers/client_controller.dart';

class DatabaseController extends ClientController {
  Databases? databases;
  @override
  void onInit() {
    super.onInit();
// appwrite
    databases = Databases(client);
  }

  Future storeUserName(Map map) async {
    try {
      final result = await databases!.createDocument(
        databaseId: "6566f32388f5faee153c",
        documentId: ID.unique(),
        collectionId: "6566f3362d93afb7a636",
        data: map,
        permissions: [
          Permission.read(Role.user("6566f430dda46ea8079d")),
          Permission.update(Role.user("6566f430dda46ea8079d")),
          Permission.delete(Role.user("6566f430dda46ea8079d")),
        ],
      );
      print("DatabaseController:: storeUserName $databases");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
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
}
