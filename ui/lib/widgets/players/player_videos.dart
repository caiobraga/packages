import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:zeder/design_system/design_system.dart';

class PlayerVideos extends StatelessWidget {
  final List<String> urlsVideos;
  final Function(String) onExcluirVideo;
  final VoidCallback onAdicionarVideo;
  const PlayerVideos({
    super.key,
    required this.urlsVideos,
    required this.onExcluirVideo,
    required this.onAdicionarVideo,
  });

  List<Widget> get videos {
    List<Widget> result = [];
    for (var i = 0; i < urlsVideos.length; i++) {
      result.add(PlayerVideosVideo(urlVideo: urlsVideos[i], indexVideo: i, onExcluirVideo: onExcluirVideo));
    }
    result.add(PlayerVideosAdicionar(onAdicionarVideo: onAdicionarVideo));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 224,
          enlargeCenterPage: true,
          enlargeFactor: 0.32,
          autoPlay: false,
          disableCenter: false,
        ),
        items: videos,
      ),
    );
  }
}

class PlayerVideosVideo extends StatefulWidget {
  final String urlVideo;
  final int indexVideo;
  final Function(String) onExcluirVideo;

  const PlayerVideosVideo({
    super.key,
    required this.urlVideo,
    required this.indexVideo,
    required this.onExcluirVideo,
  });

  @override
  State<PlayerVideosVideo> createState() => _PlayerVideosVideoState();
}

class _PlayerVideosVideoState extends State<PlayerVideosVideo> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  set isPlaying(bool value) {
    if (value == _isPlaying) return;
    setState(() {
      _isPlaying = value;
    });
  }

  _toggle() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  _onPlayerStateChanged() {
    isPlaying = _controller.value.isPlaying;
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.urlVideo);
    _controller.addListener(_onPlayerStateChanged);
    _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Stack(
          children: <Widget>[
            _controller.value.isInitialized ? VideoPlayer(_controller) : Container(),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 14, left: 9, right: 0),
                child: Container(
                  height: 28,
                  width: 28,
                  decoration: const BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.all(Radius.circular(14))),
                  child: Center(
                      child: Text(
                    "${widget.indexVideo + 1}",
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  )),
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              child: IconButton(
                onPressed: () => widget.onExcluirVideo(widget.urlVideo),
                icon: const DSIconFilledSecondarySmall(iconName: 'delete'),
              ),
            ),
            Positioned(
              top: 0.0,
              left: 256.0,
              child: IconButton(onPressed: () => _toggle(), icon: DSIconFilledSecondarySmall(iconName: _controller.value.isPlaying ? 'stop' : 'play')),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerVideosAdicionar extends StatelessWidget {
  final VoidCallback onAdicionarVideo;

  const PlayerVideosAdicionar({
    super.key,
    required this.onAdicionarVideo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  DSTextTitleBoldSecondary(text: 'ADICIONAR VÍDEO'),
                ],
              ),
            ],
          ),
          Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: IconButton(
                      onPressed: () => onAdicionarVideo,
                      icon: const DSIconFilledSecondaryLarge(iconName: 'plus'),
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
