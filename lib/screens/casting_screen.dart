import 'package:flutter/material.dart';
import 'package:tap2024/models/detail_model.dart';

class CastingScreen extends StatelessWidget {
  final TopLevel topLevel;

  const CastingScreen({Key? key, required this.topLevel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reparto'),
      ),
      body: ListView.builder(
        itemCount: topLevel.cast.length,
        itemBuilder: (context, index) {
          final actor = topLevel.cast[index];
          return ListTile(
            leading: CircleAvatar(
              // Puedes cargar la imagen del perfil del actor si tienes la URL
              // Puedes usar NetworkImage(actor.profilePath) si tienes la URL de la imagen
              child: Text(actor.name[0]), // Muestra la primera letra del nombre por ahora
            ),
            title: Text(actor.name),
            subtitle: Text(actor.character),
            // Puedes agregar más detalles del actor si lo deseas
            // Ejemplo: trailing: Text('ID: ${actor.id}'),
          );
        },
      ),
    );
  }
}
