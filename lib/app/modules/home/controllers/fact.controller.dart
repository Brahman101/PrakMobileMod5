import 'package:get/get.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modul3prak/fact_model.dart';

class FactsController extends GetxController {
  var pets = <Facts>[].obs;
  RxList<Facts> facts = RxList<Facts>([]);

  @override
  void onInit() {
    super.onInit();
    fetchFacts();
  }

  Future<void> fetchFacts() async {
    try {
      final response =
          await http.get(Uri.parse('https://meowfacts.herokuapp.com/'));
      if (response.statusCode == 200) {
        final parsedData = Facts.fromJson(json.decode(response.body));
        facts.assignAll([parsedData]);
        print("Berhasil");
      } else {
        print("Gagal");
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
      // Tangani kesalahan
    }
  }
}
