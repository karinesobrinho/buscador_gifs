import 'package:buscador_gifs/ui/gif_page.dart';
import 'package:flutter/material.dart';
import 'package:buscador_gifs/ui/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Buscador de gifs',
    home: HomePage(),
    theme: ThemeData(hintColor: Colors.white),
  ));
}
