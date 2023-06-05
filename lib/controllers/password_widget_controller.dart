import 'package:flutter/material.dart';

class PasswordWidgetController {
  // cacher la saisie
  static bool getObscure(bool isObscure) => !isObscure;

  // modifier l'icône
  static Icon getIcon(bool isObscure) {
    if (isObscure) return const Icon(Icons.visibility);
    return const Icon(Icons.visibility_off);
  }

  // modifier la couleur du container
  static Color getColor(int length) {
    if (length >= 8) {
      return Colors.greenAccent;
    } else if (length >= 4) {
      return Colors.orangeAccent;
    }
    return Colors.redAccent;
  }
}
