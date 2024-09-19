import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchivesHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historiques d\'Archivages'),
      ),
      body: Center(
        child: Text('Liste des dettes soldées ou non soldées avec leur détails'),
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
        currentIndex: 3, // Indice pour la page actuelle 
        onTap: (index) {
          if (index == 0) {
            Get.toNamed('/home');
          } else if (index == 1) {
           Get.toNamed('/clients');
          } else if (index == 2) {
           Get.toNamed('/dettes');
          } else if (index == 3) {
           Get.toNamed('/archives'); //pages archives
          }
        },
      ),
    );
  }
}
