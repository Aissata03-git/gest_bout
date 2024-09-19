import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/controllers/client.controller.dart';

class ListeClientsScreen extends StatelessWidget {
  final ClientController clientController = Get.put(ClientController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des clients'),
      ),
      body: FutureBuilder(
        future: clientController.fetchClients(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur lors du chargement des clients'));
          } else {
            return ListView.builder(
              itemCount: clientController.clients.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(clientController.clients[index].nom),
                  subtitle: Text(clientController.clients[index].telephone),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      clientController.supprimerClient(clientController.clients[index].id);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
