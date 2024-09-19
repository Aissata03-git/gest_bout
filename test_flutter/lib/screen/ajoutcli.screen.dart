import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/controllers/client.controller.dart';

class AjouterClientScreen extends StatelessWidget {
  final ClientController clientController = Get.put(ClientController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un client'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: clientController.nomController,
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: clientController.telephoneController,
              decoration: InputDecoration(labelText: 'Téléphone'),
            ),
            TextField(
              controller: clientController.adresseController,
              decoration: InputDecoration(labelText: 'Adresse'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                clientController.ajouterClient();
              },
              child: Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}
