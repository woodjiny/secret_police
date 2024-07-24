import 'dart:io';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_application_8/models/incidencia.dart';

class IncidenciaDetailScreen extends StatelessWidget {
  final Incidencia incidencia;

  IncidenciaDetailScreen({required this.incidencia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(incidencia.titulo)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Fecha: ${incidencia.fecha}'),
            SizedBox(height: 10),
            Text('Descripción: ${incidencia.descripcion}'),
            SizedBox(height: 10),
            Image.file(File(incidencia.fotoPath)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Lógica para reproducir el audio.
              },
              child: Text('Reproducir Audio'),
            ),
          ],
        ),
      ),
    );
  }
}
