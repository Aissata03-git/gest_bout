import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/controllers/client.controller.dart';

class ClientsView extends StatelessWidget {
  final ClientController clientController = Get.put(ClientController());
  final TextEditingController searchController = TextEditingController(); // Contrôleur pour la recherche

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clients', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              clientController.searchClientById(searchController.text); // Recherche par ID
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
                    clientController.searchClientById(searchController.text); // Recherche sur la soumission du texte
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (clientController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              if (clientController.filteredClients.isEmpty) {
                return Center(child: Text('Aucun client trouvé'));
              }
              return ListView.builder(
                itemCount: clientController.filteredClients.length,
                itemBuilder: (context, index) {
                  var client = clientController.filteredClients[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text("Nom : ${client.nom}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Téléphone : ${client.telephone}"),
                          Text("Adresse : ${client.adresse}"),
                          Text("ID Dette : ${client.detteId}"), // Affichage de l'ID de la dette
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Rediriger vers la page de modification
                              Get.toNamed('/clients/${client.id}/edit');
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              clientController.deleteClient(client.id!);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: () {
                              Get.toNamed('/clients/${client.id}/view');
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

