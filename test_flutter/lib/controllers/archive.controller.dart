import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_flutter/core/models/dette.models.dart';
import 'package:test_flutter/core/services/dette.service.dart';

class ArchiveController extends GetxController {
  var archives = [].obs;

  // Récupérer les dettes archivées
  Future<void> fetchArchives() async {
    var url = 'http://127.0.0.1:8000/api/dettes/archives';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      archives.value = jsonDecode(response.body);
    } else {
      Get.snackbar('Erreur', 'Échec de la récupération des archives');
    }
  }

  // Restaurer une dette archivée
  Future<void> restaurerArchive(int id) async {
    var url = 'http://127.0.0.1:8000/api/dettes/$id/restaurer';
    var response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      archives.removeWhere((archive) => archive['id'] == id);
      Get.snackbar('Succès', 'Archive restaurée');
    } else {
      Get.snackbar('Erreur', 'Échec de la restauration');
    }
  }

  // Archiver une dette
  Future<void> archiverDette(int id) async {
    var url = 'http://127.0.0.1:8000/api/dettes/$id/archiver';
    var response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      archives.removeWhere((archive) => archive['id'] == id);
      Get.snackbar('Succès', 'Dette archivée');
    } else {
      Get.snackbar('Erreur', 'Échec de l\'archivage');
    }
  }

  // Supprimer une archive
  Future<void> supprimerArchive(int id) async {
    var url = 'http://127.0.0.1:8000/api/dettes/$id/archiver';
    var response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      archives.removeWhere((archive) => archive['id'] == id);
      Get.snackbar('Succès', 'Archive supprimée');
    } else {
      Get.snackbar('Erreur', 'Échec de la suppression de l\'archive');
    }
  }

  var archivedDettes = <Dette>[].obs;  // Liste réactive d'objets Dette
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchArchivedDettes(); // Charger les dettes archivées à l'initialisation
  }

  // Fonction pour récupérer les dettes archivées
  void fetchArchivedDettes() async {
    try {
      isLoading(true);
      var dettes = await DetteService.getArchivedDettes(); // Appel au service qui récupère les dettes archivées
      if (dettes != null) {
        archivedDettes.value = dettes;
      }
    } finally {
      isLoading(false);
    }
  }
}
