import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/screen/ajoutcli.screen.dart';
import 'package:test_flutter/screen/ajoutdet.screen.dart';
import 'package:test_flutter/screen/listearch.screen.dart';
import 'package:test_flutter/screen/listecli.screen.dart';
import 'package:test_flutter/screen/listedet.screen.dart';
import 'package:test_flutter/screen/param.screen.dart';
import 'package:test_flutter/screen/soldeeD.screen.dart';
import 'package:test_flutter/views/Photo.views.dart';
import 'package:test_flutter/views/ajoutC.views.dart';
import 'package:test_flutter/views/ajoutD.views.dart';
import 'package:test_flutter/views/archives.views.dart';
import 'package:test_flutter/views/client.views.dart';
import 'package:test_flutter/views/consulter.views.dart';
import 'package:test_flutter/views/dette.views.dart';
import 'package:test_flutter/views/dettearch.views.dart';
import 'package:test_flutter/views/histoarch.views.dart';
import 'package:test_flutter/views/home.views.dart';
import 'package:test_flutter/views/modiC.views.dart';
import 'package:test_flutter/views/modiD.views.dart';
import 'package:test_flutter/views/notif.views.dart';
import 'package:test_flutter/views/param.views.dart';
import 'package:test_flutter/views/restau.views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Application de gestion',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeView()),
        GetPage(name: '/clients', page: () => ClientsView()),
        GetPage(name: '/dettes', page: () => DettesView()),
        GetPage(name: '/archives', page: () => ArchivesView()),
        GetPage(name: '/settings', page: () => SettingsView()),

        // Sous-pages pour Clients
        GetPage(name: '/client_add', page: () => AjouterClientView()),
        GetPage(name: '/client_edit/:id', page: () => ModifierClientView(clientId: 1)),
        GetPage(name: '/clients/:id/view', page: () => ClientDetailsView(clientId: int.parse(Get.parameters['id']!))),

        // Sous-pages pour Dettes
        GetPage(name: '/dette_add', page: () => AjouterDetteView()),
        GetPage(name: '/dette_edit/:id', page: () => ModifierDetteView(detteId: 1)),
        GetPage(name: '/dettes_archived', page: () => DetteArchivesView()),

        // Sous-pages pour Archives
        GetPage(name: '/archives_archived', page: () => DetteArchivesView()),
        GetPage(name: '/archives_history', page: () => ArchivesHistoryView()),
        GetPage(name: '/archives_restore', page: () => ArchivesRestoreView()),

        // Notifications et paramètres
        GetPage(name: '/notifications', page: () => NotificationsView()),
        GetPage(name: '/photoprofil', page: () => ProfilePage()),
      ],
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () => Get.toNamed('/notifications'),
          ),
          GestureDetector(
            onTap: () => Get.toNamed('/photoprofil'),
            child: CircleAvatar(
              backgroundImage: NetworkImage('url_to_image'), 
            ),
          ),
        ],
      ),
      body: Center(
        child: Text('Bienvenue à l\'Accueil'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Clients'),
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on), label: 'Dettes'),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archives'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Paramètres'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed('/');
              break;
            case 1:
              Get.toNamed('/clients');
              break;
            case 2:
              Get.toNamed('/dettes');
              break;
            case 3:
              Get.toNamed('/archives');
              break;
            case 4:
              Get.toNamed('/settings');
              break;
          }
        },
      ),
    );
  }
}
