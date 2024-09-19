import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchivesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARCHIVES', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          ListTile(
            title: Text('Données Archivées'),
            onTap: () {
              Get.toNamed('/archives_archived');
            },
          ),
          Divider(),
          ListTile(
            title: Text('Historiques d\'Archivages'),
            onTap: () {
              Get.toNamed('/archives_history');
            },
          ),
          Divider(),
          ListTile(
            title: Text('Restauration des données Archivées'),
            onTap: () {
              Get.toNamed('/archives_restore');
            },
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
        currentIndex: 3, 
        onTap: (index) {
          if (index == 0) {
            Get.toNamed('/home');
          } else if (index == 1) {
            Get.toNamed('/clients');
          } else if (index == 2) {
            Get.toNamed('/dettes');
          } else if (index == 3) {
            Get.toNamed('/archives'); // Page Archives
          }
        },
      ),
    );
  }
}
