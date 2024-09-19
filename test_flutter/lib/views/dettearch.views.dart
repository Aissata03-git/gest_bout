import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/controllers/dette.controller.dart';

class DetteArchivesView extends StatelessWidget {
  final DetteController detteController = Get.put(DetteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dettes Archivées', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Obx(() {
        if (detteController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (detteController.archivedDettes.isEmpty) {
          return Center(child: Text('Aucune dette archivée'));
        }
        return ListView.builder(
          itemCount: detteController.archivedDettes.length,
          itemBuilder: (context, index) {
            var dette = detteController.archivedDettes[index];
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text("ID Dette : ${dette.id}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Montant : ${dette.montant}"),
                    Text("Date : ${dette.date}"),
                    Text("Client : ${dette.clientId}"),
                    Text("Soldée : ${dette.solde ? 'Oui' : 'Non'}"),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {
                    // Rediriger vers la page de consultation des détails de la dette archivée
                    Get.toNamed('/dettes/${dette.id}/view');
                  },
                ),
              ),
            );
          },
        );
      }),
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
        currentIndex: 3, // Indice pour la page actuelle
        onTap: (index) {
          if (index == 0) {
            Get.toNamed('/home');
          } else if (index == 1) {
           Get.toNamed('/clients');
          } else if (index == 2) {
           Get.toNamed('/dettes');
          } else if (index == 3) {
           Get.toNamed('/archives'); // pages archives 
          }
        },
      ),
    );
  }
      
  
}
