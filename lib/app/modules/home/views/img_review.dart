import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul3prak/app/modules/home/controllers/storage_controller.dart';

class TestStorageView extends StatelessWidget {
  final StorageController _storageController = Get.put(StorageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appwrite Storage Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await _storageController.storeImage();
              },
              child: Text('Store Image'),
            ),
          ],
        ),
      ),
    );
  }
}
