import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ButtonLink extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const ButtonLink({
    super.key,
    required this.onPressed,
    required this.text,
  });


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: DSTextSubtitleBoldPrimary(text: text),
    );
  }
}

class RadioButton extends StatelessWidget {

  final String title;
  final String? subtitle;
  final Object? groupValue;
  final Object value;
  final void Function(Object?)? onChanged;
  
  final Widget? secondary;

  const RadioButton({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.secondary,

  });

  @override
  Widget build(BuildContext context) {
    return  RadioListTile(
          title: DSTextTitleBoldSecondary(text: title),
          secondary: secondary,
          subtitle: subtitle != null ? DSTextSubtitleSecondary(text: subtitle!) : null,
          activeColor: DSColors.primary,
          value: value, 
          groupValue: groupValue, 
          onChanged: onChanged,
      );
  }
 }

class BotaoPadraoGrande extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const BotaoPadraoGrande({super.key, required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return DSButtonLargePrimary(text: texto, onPressed: onPressed);
  }
}

class BotaoSecundarioGrande extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const BotaoSecundarioGrande({super.key, required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return DSButtonLargeSecondary(text: texto, onPressed: onPressed);
  }
}

class BotaoPadraoPequeno extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const BotaoPadraoPequeno({super.key, required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return DSButtonSmallPrimary(text: texto, onPressed: onPressed);
  }
}

class BotaoSecundarioPequeno extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const BotaoSecundarioPequeno({super.key, required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return DSButtonSmallSecondary(text: texto, onPressed: onPressed);
  }
}

class BarraBotoesPadraoPequeno extends StatelessWidget {
  final String textoBotaoPadrao;
  final VoidCallback onPressedBotaoPadrao;
  final String textoBotaoSecundario;
  final VoidCallback onPressedBotaoSecundario;

  const BarraBotoesPadraoPequeno({
    super.key,
    required this.textoBotaoPadrao,
    required this.onPressedBotaoPadrao,
    required this.textoBotaoSecundario,
    required this.onPressedBotaoSecundario,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BotaoSecundarioPequeno(texto: textoBotaoSecundario, onPressed: onPressedBotaoSecundario),
        BotaoPadraoPequeno(texto: textoBotaoPadrao, onPressed: onPressedBotaoPadrao),
      ],
    );
  }
}

/*
class BarraBotoesEnviarMidia extends StatelessWidget {
  const BarraBotoesEnviarMidia({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DSButtonWithIconLargeSecondary(
            onPressed: () {},
            text: 'MANDAR AUDIO',
            iconName: 'microphone',
          ),
          DSButtonWithIconLargeSecondary(
            onPressed: () {},
            text: 'MANDAR FOTO',
            iconName: 'camera-party-mode',
          ),
          DSButtonWithIconLargeSecondary(
            onPressed: () {},
            text: 'MANDAR VIDEO',
            iconName: 'video',
          ),
        ],
      ),
    );
  }
}
 */

/*
class BotaoEscolherData extends StatelessWidget {
  const BotaoEscolherData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        DSButtonLargeSendMidiaTertiary(
          onPressed: () {},
          text: '06 November 2023',
          iconName: 'calendar-month-outline',
        ),
      ]),
    );
  }
}
*/
