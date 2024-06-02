import 'package:flutter/material.dart';
import 'package:tap2024/models/trailer_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerScreen extends StatefulWidget {
  final List<VideoModel> videos;

  const TrailerScreen({Key? key, required this.videos}) : super(key: key);

  @override
  _TrailerScreenState createState() => _TrailerScreenState();
}

class _TrailerScreenState extends State<TrailerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final firstVideoKey = widget.videos.first.key; // Obtén la clave del primer video
    final videoUrl = 'https://www.youtube.com/watch?v=$firstVideoKey'; // Construye la URL de YouTube
    _controller = YoutubePlayerController(
      initialVideoId: firstVideoKey,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trailer'),
      ),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () {
          // Additional logic when player is ready
        },
      ),
    );
  }
}
