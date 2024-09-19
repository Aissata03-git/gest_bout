import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/controllers/dette.controller.dart';

class ListeDettesScreen extends StatelessWidget {
  final DetteController detteController = Get.put(DetteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des dettes'),
      ),
      body: FutureBuilder(
        future: detteController.fetchDettes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur lors du chargement des dettes'));
          } else {
            return ListView.builder(
              itemCount: detteController.dettes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Dette ID: ${detteController.dettes[index].clientId}'),
                  subtitle: Text('Montant: ${detteController.dettes[index].montant}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      detteController.supprimerDette(detteController.dettes[index].id);
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
