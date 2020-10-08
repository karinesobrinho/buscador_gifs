import 'package:flutter/material.dart';
import 'package:buscador_gifs/ui/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Buscador de gifs',
    home: home_page(),
    theme: ThemeData(hintColor: Colors.white),
  ));
}
