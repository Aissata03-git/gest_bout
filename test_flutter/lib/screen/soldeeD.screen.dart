import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/controllers/dette.controller.dart';

class SoldeDetteScreen extends StatelessWidget {
  final DetteController detteController = Get.put(DetteController());
  final int detteId; // L'identifiant de la dette à solder

  SoldeDetteScreen({required this.detteId});

  @override
  Widget build(BuildContext context) {
    TextEditingController montantController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Solde Dette'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: montantController,
              decoration: InputDecoration(
                labelText: 'Montant à rembourser',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                var montant = double.tryParse(montantController.text);
                if (montant != null) {
                  detteController.solderDette(detteId, montant);
                } else {
                  Get.snackbar('Erreur', 'Veuillez entrer un montant valide');
                }
              },
              child: Text('Valider le paiement'),
            ),
          ],
        ),
      ),
    );
  }
}
