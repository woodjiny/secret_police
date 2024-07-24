import 'package:flutter/material.dart';

class SeguridadScreen extends StatelessWidget {
  final VoidCallback onDeleteAll;

  SeguridadScreen({required this.onDeleteAll});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seguridad')),
      body: Center(
        child: ElevatedButton(
          onPressed: onDeleteAll,
          child: Text('Eliminar Todos los Registros'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
