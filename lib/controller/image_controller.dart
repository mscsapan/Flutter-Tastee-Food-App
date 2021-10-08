import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'registration_validate_controller.dart';

class UploadImageController extends ChangeNotifier {
  String? image;
  //final FirebaseStorage _storage = FirebaseStorage.instance;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  uploadImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();

    final XFile? _image;

    await Permission.photos.request();
    var status = await Permission.photos.status;

    if (status.isGranted) {
      _image = await _picker.pickImage(
          source: ImageSource.gallery, maxHeight: 150, maxWidth: 150.0);
      if (_image != null) {
        _uploadToFirebase(_image.path);
        //warning.showSnackBar(context, name);
      } else {
        warning.showSnackBar(context, 'No Image Selected');
      }
    } else {
      warning.showToastMessage(context, 'Permission Denied');
    }
  }

  Future<void> _uploadToFirebase(String image) async {
    var file = File(image);
    //String name = file.uri.path.split('/').last;
    String name = DateTime.now().toString();
    var upload = await storage.ref('picture/$name').putFile(file);
    Future<String> download =
        firebase_storage.FirebaseStorage.instance.ref().getDownloadURL();
    image = download.toString();
    notifyListeners();
  }
}
