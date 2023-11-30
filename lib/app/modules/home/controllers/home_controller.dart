import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs; // Initialize with the default index

  void changePage(int index) {
    currentIndex.value = index; // Update the current index
  }
}
