import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ImageLoader extends StatefulWidget {
  final String imageUrl;

  const ImageLoader({required this.imageUrl});

  @override
  _ImageLoaderState createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  late final Reference _storageReference;
  late final Image _image;

  @override
  void initState() {
    super.initState();
    _storageReference = FirebaseStorage.instance.ref().child(widget.imageUrl);
    _image = Image.network(widget.imageUrl);
    precacheImage(_image.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return _image; // Puedes usar esto directamente en tu widget de imagen.
  }
}
