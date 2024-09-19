import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/controllers/dette.controller.dart';

class ModifierDetteView extends StatelessWidget {
  final DetteController detteController = Get.put(DetteController());
  final int detteId;

  ModifierDetteView({required this.detteId});

  @override
  Widget build(BuildContext context) {
    var dette = detteController.getDetteById(detteId);
    
    detteController.clientIdController.text = dette.clientId.toString();
    detteController.dateController.text = dette.date;
    detteController.montantController.text = dette.montant.toString();
    detteController.solde.value = dette.solde;

    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier une dette', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Id_Client'),
              controller: detteController.clientIdController,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Date'),
              controller: detteController.dateController,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Montant'),
              controller: detteController.montantController,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Soldé'),
                Checkbox(
                  value: detteController.solde.value,
                  onChanged: (value) {
                    detteController.solde.value = value!;
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                detteController.modifierDette(detteId);
              },
              child: Text('Modifier'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Clients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Dettes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'Archives',
          ),
        ],
        currentIndex: 2, // Indice pour la page actuelle
        onTap: (index) {
          if (index == 0) {
            Get.toNamed('/home');
          } else if (index == 1) {
           Get.toNamed('/clients');
          } else if (index == 2) {
           Get.toNamed('/dettes');
          } else if (index == 3) {
           Get.toNamed('/archives'); 
          }
        },
      ),
    );
  }
}
