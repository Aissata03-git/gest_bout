import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/controllers/archive.controller.dart';

class ListeArchivesScreen extends StatelessWidget {
  final ArchiveController archiveController = Get.put(ArchiveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archives'),
      ),
      body: FutureBuilder(
        future: archiveController.fetchArchives(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur lors du chargement des archives'));
          } else {
            return ListView.builder(
              itemCount: archiveController.archives.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Dette ID: ${archiveController.archives[index]['client_id']}'),
                  subtitle: Text('Montant: ${archiveController.archives[index]['montant']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.restore),
                        onPressed: () {
                          archiveController.restaurerArchive(archiveController.archives[index]['id']);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          archiveController.supprimerArchive(archiveController.archives[index]['id']);
                        },
                      ),
                    ],
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
