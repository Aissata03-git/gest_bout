import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_flutter/core/models/dette.models.dart';
import 'dart:convert';

import 'package:test_flutter/core/services/dette.service.dart';

class DetteController extends GetxController {
  var clientIdController = TextEditingController();
  var dateController = TextEditingController();
  var montantController = TextEditingController();
  var solde = false.obs;

  // Fonction pour ajouter une dette via l'API Laravel
  Future<void> ajouterDette() async {
    var url = 'http://127.0.0.1:8000/api/dettes';
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'client_id': clientIdController.text,
        'date': dateController.text,
        'montant': montantController.text,
        'solde': solde.value ? 1 : 0,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 201) {
      Get.snackbar('Succès', 'Dette ajoutée avec succès');
      clientIdController.clear();
      dateController.clear();
      montantController.clear();
      solde.value = false;
    } else {
      Get.snackbar('Erreur', 'Échec de l\'ajout de la dette');
    }
  }

  var dettes = [].obs;

  get isLoading => null;

  get filteredDettes => null;

  get archivedDettes => null; // Liste observable des dettes

  // Récupérer toutes les dettes
  Future<void> fetchDettes() async {
    var url = 'http://127.0.0.1:8000/api/dettes';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      dettes.value = jsonDecode(response.body);
    } else {
      Get.snackbar('Erreur', 'Échec de la récupération des dettes');
    }
  }

  // Supprimer une dette
  Future<void> supprimerDette(int id) async {
    var url = 'http://127.0.0.1:8000/api/dettes/$id';
    var response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      dettes.removeWhere((dette) => dette['id'] == id);
      Get.snackbar('Succès', 'Dette supprimée');
    } else {
      Get.snackbar('Erreur', 'Échec de la suppression de la dette');
    }
  }


  Future<void> solderDette(int detteId, double montant) async {
  var url = 'http://127.0.0.1:8000/api/dettes/$detteId/solde';
  var response = await http.post(
    Uri.parse(url),
    body: {'montant': montant.toString()},
  );

  if (response.statusCode == 200) {
    // Mettre à jour la liste des dettes ou retirer la dette soldée
    dettes.removeWhere((dette) => dette['id'] == detteId);
    Get.snackbar('Succès', 'Dette soldée avec succès');
  } else {
    Get.snackbar('Erreur', 'Échec du solde de la dette');
  }
  }

  void addDette(Dette dette) async {
    await DetteService.addDette(dette);
    fetchDettes(); // Rafraîchir la liste des dettes après l'ajout
  }

  void updateDette(int id, Dette dette) async {
    await DetteService.updateDette(id, dette);
    fetchDettes(); // Rafraîchir la liste après la mise à jour
  }

  void deleteDette(int id) async {
    await DetteService.deleteDette(id);
    fetchDettes(); // Rafraîchir la liste après suppression
  }

  void fetchArchivedDettes() async {
    try {
      isLoading(true);
      archivedDettes.value = await DetteService.getArchivedDettes();
    } finally {
      isLoading(false);
    }
  }

  

  void DetteService(param0) {}

  getDetteById(int detteId) {}

  void modifierDette(int detteId) {}

  void searchDetteById(String text) {}
}

extension on void Function(dynamic param0) {
  getArchivedDettes() {}
  
  deleteDette(int id) {}
  
  updateDette(int id, Dette dette) {}
  
  addDette(Dette dette) {}
}
