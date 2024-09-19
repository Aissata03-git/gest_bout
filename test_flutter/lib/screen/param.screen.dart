import 'package:flutter/material.dart';

class ParametresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Modifier le profil'),
            leading: Icon(Icons.person),
            onTap: () {
              // Naviguer vers l'écran de modification de profil
            },
          ),
          ListTile(
            title: Text('Changer le mot de passe'),
            leading: Icon(Icons.lock),
            onTap: () {
              // Naviguer vers l'écran de changement de mot de passe
            },
          ),
          ListTile(
            title: Text('Notifications'),
            leading: Icon(Icons.notifications),
            onTap: () {
              // Naviguer vers les paramètres de notification
            },
          ),
        ],
      ),
    );
  }
}
