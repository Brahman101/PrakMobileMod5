import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

class ClientController extends GetxController {
  late Client client;

  @override
  void onInit() {
    super.onInit();

    // appwrite
    const endPoint = "https://cloud.appwrite.io/v1";
    const projectID = "6566ea675b2ac4ea9005";

    // Initialize the Appwrite client
    client = Client();
    client
        .setEndpoint(endPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);
  }
}
