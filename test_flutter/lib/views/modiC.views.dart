import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/controllers/client.controller.dart';


class ModifierClientView extends StatelessWidget {
  final ClientController clientController = Get.put(ClientController());
  final int clientId;

  ModifierClientView({super.key, required this.clientId});

  @override
  Widget build(BuildContext context) {
    var client = clientController.getClientById(clientId);
    
    clientController.nomController.text = client.nom;
    clientController.telephoneController.text = client.telephone;
    clientController.adresseController.text = client.adresse;

    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier un client', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nom'),
              controller: clientController.nomController,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Téléphone'),
              controller: clientController.telephoneController,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Adresse'),
              controller: clientController.adresseController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                clientController.modifierClient(clientId);
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
        currentIndex: 1, // Indice pour la page actuelle
        onTap: (index) {
          if (index == 0) {
            Get.toNamed('/home');// Page Accueil
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
