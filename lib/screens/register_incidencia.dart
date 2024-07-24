// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_application_8/screens/register_incidencia.dart';
import 'package:image_picker/image_picker.dart';
// ignore: unused_import
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../models/incidencia.dart';

class RegisterIncidenciaScreen extends StatefulWidget {
  @override
  _RegisterIncidenciaScreenState createState() => _RegisterIncidenciaScreenState();
}

class _RegisterIncidenciaScreenState extends State<RegisterIncidenciaScreen> {
  final _formKey = GlobalKey<FormState>();
  String _titulo = '';
  String _descripcion = '';
  XFile? _foto;
  String? _audioPath;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _foto = pickedImage;
    });
  }

  Future<void> _startRecording() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.path}/${DateTime.now().millisecondsSinceEpoch}.aac';
    await AudioRecorder.start(
      path: filePath,
      audioOutputFormat: AudioOutputFormat.AAC,
    );
    setState(() {
      _audioPath = filePath;
    });
  }

  Future<void> _stopRecording() async {
    await AudioRecorder.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar Incidencia')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Título'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese un título';
                }
                return null;
              },
              onSaved: (value) {
                _titulo = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Descripción'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese una descripción';
                }
                return null;
              },
              onSaved: (value) {
                _descripcion = value!;
              },
            ),
            SizedBox(height: 10),
            _foto == null
                ? Text('No se ha seleccionado ninguna imagen.')
                : Image.file(File(_foto!.path)),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Tomar Foto'),
            ),
            SizedBox(height: 10),
            _audioPath == null
                ? Text('No se ha grabado ningún audio.')
                : Text('Audio grabado: $_audioPath'),
            ElevatedButton(
              onPressed: _startRecording,
              child: Text('Grabar Audio'),
            ),
            ElevatedButton(
              onPressed: _stopRecording,
              child: Text('Detener Grabación'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Aquí puedes guardar la nueva incidencia en una base de datos local o en una lista.
                }
              },
              child: Text('Guardar Incidencia'),
            ),
          ],
        ),
      ),
    );
  }
}

class AAC {
}

class AudioOutputFormat {
}

class AudioRecorder {
  static start({required String path, required audioOutputFormat}) {}
  
  static stop() {}
}
