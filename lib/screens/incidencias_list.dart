import 'package:flutter/material.dart';
import 'package:flutter_application_8/models/incidencia.dart';
import 'incidencia_detail.dart';

class IncidenciasListScreen extends StatelessWidget {
  final List<Incidencia> incidencias;

  IncidenciasListScreen({required this.incidencias});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Incidencias')),
      body: ListView.builder(
        itemCount: incidencias.length,
        itemBuilder: (context, index) {
          final incidencia = incidencias[index];
          return ListTile(
            title: Text(incidencia.titulo),
            subtitle: Text(incidencia.fecha.toString()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IncidenciaDetailScreen(incidencia: incidencia),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
