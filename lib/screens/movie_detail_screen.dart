import 'package:flutter/material.dart';
import 'package:tap2024/models/popular_model.dart';
import 'package:tap2024/models/detail_model.dart';
import 'package:tap2024/network/api_detail.dart';
import 'casting_screen.dart';
import 'trailer_screen.dart'; // Importa la clase TrailerScreen

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final popularModel = ModalRoute.of(context)!.settings.arguments as PopularModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(popularModel.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite; // Cambiar el estado de la película como favorita
              });
            },
            icon: isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://image.tmdb.org/t/p/w500${popularModel.posterPath}'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          popularModel.title,
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 8),
                            Text(
                              '${popularModel.voteAverage}/10',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Descripción:',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          popularModel.overview,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final api = ApiPopular();
                        final topLevel = await api.getMovieCredits(popularModel.id);

                        if (topLevel != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CastingScreen(topLevel: topLevel),
                            ),
                          );
                        }
                      },
                      child: Text('Ver Actores'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        // Supongamos que ya tienes una lista de videos disponible llamada `videosList`
                        final videosList = []; // Debes obtener la lista de videos de alguna manera

                        // Navega a la clase TrailerScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrailerScreen(
                              movieId: popularModel.id, // O cualquier otra forma de obtener el ID de la película
                              videos: videosList,
                            ),
                          ),
                        );
                      },
                      child: Text('Ver Trailer'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
