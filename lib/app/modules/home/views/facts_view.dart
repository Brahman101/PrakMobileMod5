import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul3prak/app/modules/home/controllers/fact.controller.dart';

class FactsView extends StatelessWidget {
  final FactsController factsController = Get.put(FactsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (factsController.facts.isNotEmpty) {
          final data = factsController.facts.first;
          final fakta = data.data.first;
          return Center(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '$fakta',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
