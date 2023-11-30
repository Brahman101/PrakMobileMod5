import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modul3prak/app/modules/home/controllers/client_controller.dart';

class StorageController extends ClientController {
  Storage? storage;
  @override
  void onInit() {
    super.onInit();
// appwrite
    storage = Storage(client);
  }

  Future storeImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image == null) {
        print('no img selected');
        return;
      }

      final result = await storage!.createFile(
        bucketId: '6566f467baa4b7931dd5',
        fileId: ID.unique(),
        file: InputFile.fromPath(
          path:
              'https://cloud.appwrite.io/v1/storage/buckets/6566f467baa4b7931dd5/files/6566f5e2be6d5c0cc78b/view?project=6566ea675b2ac4ea9005&mode=admin',
          filename: '75049913_p0_master1200.jpg',
        ),
      );
      print("StorageController:: storeImage $result");
    } catch (error) {
      Get.defaultDialog(
        title: "Error Storage",
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
