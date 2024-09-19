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
import 'package:test_flutter/views/notif.views.art';
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
      home: Scaffold(
        appBar: AppBar(title: Text('Application de gestion')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Get.toNamed('/home'),
                child: Text('Accueil'),
              ),
              ElevatedButton(
                onPressed: () => Get.toNamed('/clients'),
                child: Text('Clients'),
              ),
              ElevatedButton(
                onPressed: () => Get.toNamed('/dettes'),
                child: Text('Dettes'),
              ),
              ElevatedButton(
                onPressed: () => Get.toNamed('/archives'),
                child: Text('Archives'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(AjouterClientScreen());
                },
                child: Text('Ajouter un client'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(ListeClientsScreen());
                },
                child: Text('Liste des clients'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(AjouterDetteScreen());
                },
                child: Text('Ajouter une dette'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(ListeDettesScreen());
                },
                child: Text('Liste des dettes'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(ListeArchivesScreen());
                },
                child: Text('Voir les archives'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(SoldeDetteScreen(detteId: 1)); 
                },
                child: Text('Solder une dette'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(ParametresScreen());
                },
                child: Text('Paramètres'),
              ),
            ],
          ),
        ),
      ),
      title: 'Gestion',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeView()),
        GetPage(name: '/clients', page: () => ClientsView()),
        GetPage(name: '/archives', page: () => ArchivesView()),
        GetPage(name: '/dettes', page: () => DettesView()),
        GetPage(name: '/settings', page: () => SettingsView()),
        GetPage(name: '/clients/:id/view', page: () => ClientDetailsView(clientId: int.parse(Get.parameters['id']!))),

        GetPage(name: '/client_add', page: () => AjouterClientView()),
        GetPage(name: '/dette_add', page: () => AjouterDetteView()),
        GetPage(name: '/client_edit/:id', page: () => ModifierClientView(clientId:1,)), // Modification de client
        GetPage(name: '/dette_edit/:id', page: () => ModifierDetteView(detteId: 1,)), // Modification de dette

        GetPage(name: '/archives_archived', page: () => DetteArchivesView()),
        GetPage(name: '/archives_history', page: () => ArchivesHistoryView()),
        GetPage(name: '/archives_restore', page: () => ArchivesRestoreView()),
        GetPage(name: '/notifications', page: () => NotificationsView()),
        GetPage(name: '/photoprofil', page: () => ProfilePage()),
   ]
    );
  }
}
