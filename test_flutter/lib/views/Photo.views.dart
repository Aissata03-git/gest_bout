import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:test_flutter/core/services/photoser.services.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final PhotoService _photoService = PhotoService();
  String? _imageUrl;

  // Fonction pour choisir une image depuis la galerie
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Fonction pour uploader l'image
  Future<void> _uploadImage() async {
    if (_image != null) {
      String? imageUrl = await _photoService.uploadImageToCloudinary(_image!.path);
      if (imageUrl != null) {
        setState(() {
          _imageUrl = imageUrl;  // URL de l'image après l'upload
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image téléchargée avec succès !')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur lors du téléchargement de l\'image.')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier le Profil'),
      ),
      body: Column(
        children: [
          _image != null ? Image.file(_image!) : Placeholder(fallbackHeight: 200),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Choisir une image'),
          ),
          ElevatedButton(
            onPressed: _uploadImage,
            child: Text('Uploader l\'image'),
          ),
          if (_imageUrl != null) Text('Image URL : $_imageUrl'), // Affiche l'URL après l'upload
        ],
      ),
    );
  }
}

extension on ImagePicker {
  pickImage({required ImageSource source}) {}
}

class ImagePicker {
}
