import 'package:flutter/material.dart';

import '../widgets/players/barra_botoes_media.dart';

class BarraBotoesMediaScreen extends StatefulWidget {
  const BarraBotoesMediaScreen({Key? key}) : super(key: key);

  @override
  BarraBotoesMediaScreenState createState() => BarraBotoesMediaScreenState();
}

class BarraBotoesMediaScreenState extends State<BarraBotoesMediaScreen> {
  List<String> fotos = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
  ];

  List<String> videos = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ];

  void onExcluirFoto(String url) {
    setState(() {
      fotos.remove(url);
    });
  }

  void onExcluirVideo(String url) {
    setState(() {
      videos.remove(url);
    });
  }

  String audio = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';
  bool enviaAudio = true;
  void onExcluirAudio(String url) {
    setState(() {
      enviaAudio = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Barra Botoes Media"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BarraBotoesMedia(
                urlAudio: null,
                permiteEnviarAudio: false,
                onEnviarAudio: () {},
                onExcluirAudio: (url) {},
                urlsFotos: [],
                permiteEnviarFotos: true,
                onEnviarFotos: () {},
                onExcluirFoto: onExcluirFoto,
                urlsVideos: [],
                onExcluirVideo: onExcluirVideo,
                permiteEnviarVideos: true,
                onEnviarVideos: () {},
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 8),
              BarraBotoesMedia(
                urlAudio: audio,
                permiteEnviarAudio: enviaAudio,
                onEnviarAudio: () {},
                onExcluirAudio: onExcluirAudio,
                urlsFotos: fotos,
                permiteEnviarFotos: true,
                onEnviarFotos: () {},
                onExcluirFoto: onExcluirFoto,
                urlsVideos: videos,
                onExcluirVideo: onExcluirVideo,
                permiteEnviarVideos: true,
                onEnviarVideos: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
