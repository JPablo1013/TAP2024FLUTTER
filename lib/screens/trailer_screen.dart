import 'package:flutter/material.dart';
import 'package:tap2024/models/trailer_model.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class TrailerScreen extends StatefulWidget {
  final int movieId;
  final List<VideoModel> videos;

  const TrailerScreen({Key? key, required this.movieId, required this.videos}) : super(key: key);

  @override
  _TrailerScreenState createState() => _TrailerScreenState();
}


class _TrailerScreenState extends State<TrailerScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    // Selecciona el primer video de la lista para reproducir
    _videoPlayerController = VideoPlayerController.network(widget.videos.first.key);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false, // Para que no se reproduzca automáticamente al abrir la pantalla
      looping: false,
      // Configuraciones adicionales según tus necesidades
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trailers'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.videos.length,
              itemBuilder: (context, index) {
                final video = widget.videos[index];
                return ListTile(
                  title: Text(video.name),
                  onTap: () {
                    // Cambia el video a reproducir cuando se toca un elemento de la lista
                    _videoPlayerController.pause();
                    _videoPlayerController = VideoPlayerController.network(video.key);
                    _chewieController = ChewieController(
                      videoPlayerController: _videoPlayerController,
                      autoPlay: true, // Para reproducir automáticamente al cambiar de video
                      looping: false,
                      // Configuraciones adicionales según tus necesidades
                    );
                    setState(() {});
                  },
                );
              },
            ),
          ),
          // Mostrar el visor de video
          Chewie(controller: _chewieController),
        ],
      ),
    );
  }
}
