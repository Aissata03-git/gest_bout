import 'package:test_flutter/core/models/dette.models.dart';

class DetteService {
  static Future<List<Dette>> getArchivedDettes() async {
    await Future.delayed(Duration(seconds: 2)); // Simule un délai de réponse

    // Retourne une liste fictive de dettes archivées
    return [
      Dette(id: 1, montant: 500, date: '2024-09-01', clientId: 101, solde: true),
      Dette(id: 2, montant: 300, date: '2024-08-15', clientId: 102, solde: false),
      Dette(id: 3, montant: 1500, date: '2024-07-20', clientId: 103, solde: true),
    ];
  }
}

