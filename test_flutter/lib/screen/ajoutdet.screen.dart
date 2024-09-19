import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/controllers/dette.controller.dart';

class AjouterDetteScreen extends StatelessWidget {
  final DetteController detteController = Get.put(DetteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une dette'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: detteController.clientIdController,
              decoration: InputDecoration(labelText: 'ID du Client'),
            ),
            TextField(
              controller: detteController.dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: detteController.montantController,
              decoration: InputDecoration(labelText: 'Montant'),
            ),
            CheckboxListTile(
              title: Text("Soldé"),
              value: detteController.solde.value,
              onChanged: (newValue) {
                detteController.solde.value = newValue!;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                detteController.ajouterDette();
              },
              child: Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}
