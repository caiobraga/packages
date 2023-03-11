import 'package:flutter/material.dart';
import 'package:zeder/ui/widgets/players/player_audio.dart';
import 'package:zeder/ui/widgets/players/player_fotos.dart';
import 'package:zeder/ui/widgets/players/player_videos.dart';

import '../../../design_system/widgets/buttons.dart';

class BarraBotoesMedia extends StatelessWidget {
  final String? urlAudio;
  final VoidCallback onEnviarAudio;
  final Function(String) onExcluirAudio;
  final bool permiteEnviarAudio;

  final List<String> urlsFotos;
  final VoidCallback onEnviarFotos;
  final Function(String) onExcluirFoto;
  final bool permiteEnviarFotos;

  final List<String> urlsVideos;
  final VoidCallback onEnviarVideos;
  final Function(String) onExcluirVideo;
  final bool permiteEnviarVideos;

  const BarraBotoesMedia({
    super.key,
    required this.urlAudio,
    required this.onEnviarAudio,
    required this.onExcluirAudio,
    required this.permiteEnviarAudio,
    required this.urlsFotos,
    required this.onEnviarFotos,
    required this.onExcluirFoto,
    required this.permiteEnviarFotos,
    required this.urlsVideos,
    required this.onEnviarVideos,
    required this.onExcluirVideo,
    required this.permiteEnviarVideos,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        urlAudio != null ? PlayerAudio(urlAudio: urlAudio!, onExcluirAudio: onExcluirAudio) : BotaoEnviaMedia.audio(isEnabled: permiteEnviarAudio, onPressed: onEnviarAudio),
        const SizedBox(height: 20),
        urlsFotos.isNotEmpty ? PlayerFotos(urlsFotos: urlsFotos!, onExcluirFoto: onExcluirFoto, onAdicionarFoto: onEnviarFotos) : BotaoEnviaMedia.foto(isEnabled: permiteEnviarFotos, onPressed: onEnviarFotos),
        const SizedBox(height: 20),
        urlsVideos.isNotEmpty ? PlayerVideos(urlsVideos: urlsVideos!, onExcluirVideo: onExcluirVideo, onAdicionarVideo: onEnviarVideos) : BotaoEnviaMedia.video(isEnabled: permiteEnviarVideos, onPressed: onEnviarVideos),
      ],
    );
  }
}

class BotaoEnviaMedia extends StatelessWidget {
  final String texto;
  final String icone;
  final bool isEnabled;
  final VoidCallback onPressed;

  const BotaoEnviaMedia._({
    super.key,
    required this.texto,
    required this.icone,
    required this.isEnabled,
    required this.onPressed,
  });

  factory BotaoEnviaMedia.audio({required VoidCallback onPressed, required bool isEnabled}) {
    return BotaoEnviaMedia._(
      texto: 'MANDAR AUDIO',
      icone: 'microphone',
      onPressed: onPressed,
      isEnabled: isEnabled,
    );
  }

  factory BotaoEnviaMedia.foto({required VoidCallback onPressed, required bool isEnabled}) {
    return BotaoEnviaMedia._(
      texto: 'MANDAR FOTO',
      icone: 'camera-party-mode',
      onPressed: onPressed,
      isEnabled: isEnabled,
    );
  }

  factory BotaoEnviaMedia.video({required VoidCallback onPressed, required bool isEnabled}) {
    return BotaoEnviaMedia._(
      texto: 'MANDAR VIDEO',
      icone: 'video',
      onPressed: onPressed,
      isEnabled: isEnabled,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isEnabled
        ? DSButtonWithIconLargeSecondary(
            text: texto,
            iconName: icone,
            onPressed: onPressed,
          )
        : DSButtonWithIconLargeTertiary(
            text: texto,
            iconName: icone,
            onPressed: onPressed,
          );
  }
}
