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
              backgroundImage: NetworkImage('https://image.tmdb.org/t/p/w500${actor.profilePath}'),
            ),
            title: Text(actor.name),
            subtitle: Text(actor.character),
          );
        },
      ),
    );
  }
}
