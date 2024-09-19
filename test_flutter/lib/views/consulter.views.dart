import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/controllers/client.controller.dart';

class ClientDetailsView extends StatelessWidget {
  final int clientId;
  
  ClientDetailsView({required this.clientId});

  @override
  Widget build(BuildContext context) {
    final clientController = Get.find<ClientController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du Client'),
      ),
      body: Obx(() {
        var client = clientController.clients.firstWhere((c) => c.id == clientId);

        return client != null ? Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nom : ${client.nom}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Téléphone : ${client.telephone}"),
              Text("Adresse : ${client.adresse}"),
              Text("ID Dette : ${client.detteId}"),
              // Autres informations si besoin
            ],
          ),
        ) : Center(child: Text("Client non trouvé"));
      }),
    );
  }
}
