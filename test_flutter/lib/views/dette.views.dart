import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/controllers/dette.controller.dart';

class DettesView extends StatelessWidget {
  final DetteController detteController = Get.put(DetteController());
  final TextEditingController searchController = TextEditingController(); // Contrôleur pour la recherche

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dettes', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              detteController.searchDetteById(searchController.text); // Recherche par ID
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher par ID',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    detteController.searchDetteById(searchController.text); // Recherche sur soumission du texte
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (detteController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              if (detteController.filteredDettes.isEmpty) {
                return Center(child: Text('Aucune dette trouvée'));
              }
              return ListView.builder(
                itemCount: detteController.filteredDettes.length,
                itemBuilder: (context, index) {
                  var dette = detteController.filteredDettes[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text("Montant : ${dette.montant}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Client : ${dette.clientId}"),
                          Text("Date : ${dette.date}"),
                          Text("Soldé : ${dette.solde ? 'Oui' : 'Non'}"),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Get.toNamed('/dettes/${dette.id}/edit');
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              detteController.deleteDette(dette.id!);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.archive),
                            onPressed: () {
                              Get.toNamed('/archives_archived');
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
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
        currentIndex: 2, // Indice pour la page actuelle (Dettes)
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
