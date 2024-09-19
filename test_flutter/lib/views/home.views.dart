import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications), 
            onPressed: () {
              Get.toNamed('/notifications'); 
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                // Action lorsque l'utilisateur clique sur la photo
                Get.toNamed('/settings'); // Redirige vers la page des paramètres
              },
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/images/profile_picture.jpg'), // Chemin vers l'image de profil
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.settings, 
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          // Autres éléments de la page d'accueil
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
        currentIndex: 0, // Accueil est la page actuelle
        onTap: (index) {
          if (index == 0) {
            Get.toNamed('/home');
          } else if (index == 1) {
            Get.toNamed('/clients');
          } else if (index == 2) {
            Get.toNamed('/dettes');
          } else if (index == 3) {
            Get.toNamed('/archives');
          }
        },
      ),
    );
  }
}
