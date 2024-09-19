import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_flutter/core/models/client.models.dart';
import 'package:test_flutter/core/services/client.service.dart';

class ClientController extends GetxController {
  var nomController = TextEditingController();
  var telephoneController = TextEditingController();
  var adresseController = TextEditingController();
  
  get http => null;

  Future<void> ajouterClient() async {
    var url = 'http://127.0.0.1:8000/api/clients';
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'nom': nomController.text,
        'telephone': telephoneController.text,
        'adresse': adresseController.text,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 201) {
      Get.snackbar('Succès', 'Client ajouté avec succès');
    } else {
      Get.snackbar('Erreur', 'Échec de l\'ajout du client');
    }
  }


  var clients = [].obs;

  get isLoading => null;

  get filteredClients => null; // Liste observable des clients

  // Récupérer tous les clients
  Future<void> fetchClients() async {
    var url = 'http://127.0.0.1:8000/api/clients';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      clients.value = jsonDecode(response.body);
    } else {
      Get.snackbar('Erreur', 'Échec de la récupération des clients');
    }
  }

  // Supprimer un client
  Future<void> supprimerClient(int id) async {
    var url = 'http://127.0.0.1:8000/api/clients/$id';
    var response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      clients.removeWhere((client) => client['id'] == id);
      Get.snackbar('Succès', 'Client supprimé');
    } else {
      Get.snackbar('Erreur', 'Échec de la suppression du client');
    }
  }

  void deleteClient(param0) {}

  getClientById(int clientId) {}

  void modifierClient(int clientId) {}

  void searchClientById(String text) {}
}
