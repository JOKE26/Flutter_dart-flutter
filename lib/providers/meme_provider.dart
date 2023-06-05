import 'package:appcours/models/meme.dart';
import 'package:flutter/material.dart';

class MemeProvider extends ChangeNotifier {
  Meme? _meme;

  //getter /setter
  Meme get meme => _meme!;

  set meme(Meme? value) {
    _meme = value;
    // notifier les ecouters
    notifyListeners();
  }
}
