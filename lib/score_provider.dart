import 'package:flutter/material.dart';

class ScoreProvider extends ChangeNotifier {
  int _puntos = 0;
  int get puntos => _puntos;

  void sumar() {
    _puntos++;
    notifyListeners();
  }

  void reiniciar() {
    _puntos = 0;
    notifyListeners();
  }
}