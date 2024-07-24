import 'dart:io';

import 'package:flutter/material.dart';

class AcercaDeScreen extends StatelessWidget {
  final String fotoPath;
  final String nombre;
  final String apellido;
  final String matricula;
  final String reflexion;

  AcercaDeScreen({
    required this.fotoPath,
    required this.nombre,
    required this.apellido,
    required this.matricula,
    required this.reflexion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Acerca de')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.file(File(fotoPath)),
            SizedBox(height: 10),
            Text('Nombre: $nombre $apellido'),
            Text('Matrícula: $matricula'),
            SizedBox(height: 20),
            Text(
              reflexion,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
