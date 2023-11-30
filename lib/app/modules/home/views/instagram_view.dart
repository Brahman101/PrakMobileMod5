import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul3prak/app/modules/home/controllers/instagram_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InstagramView extends StatelessWidget {
  final InstagramController controller = Get.put(InstagramController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller.controller),
    );
  }
}
