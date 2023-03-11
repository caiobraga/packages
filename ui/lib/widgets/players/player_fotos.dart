import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

class PlayerFotos extends StatelessWidget {
  final List<String> urlsFotos;
  final Function(String) onExcluirFoto;
  final VoidCallback onAdicionarFoto;
  const PlayerFotos({
    super.key,
    required this.urlsFotos,
    required this.onExcluirFoto,
    required this.onAdicionarFoto,
  });

  List<Widget> get images {
    List<Widget> result = [];
    for (var i = 0; i < urlsFotos.length; i++) {
      result.add(PlayerFotosFoto(urlFoto: urlsFotos[i], indexFoto: i, onExcluirFoto: onExcluirFoto));
    }
    result.add(PlayerFotosAdicionar(onAdicionarFoto: onAdicionarFoto));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 224,
            enlargeCenterPage: true,
            enlargeFactor: 0.32,
            autoPlay: false,
            disableCenter: false,
          ),
          items: images,
        ));
  }
}

class PlayerFotosFoto extends StatelessWidget {
  final String urlFoto;
  final int indexFoto;
  final Function(String) onExcluirFoto;

  const PlayerFotosFoto({
    super.key,
    required this.urlFoto,
    required this.indexFoto,
    required this.onExcluirFoto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Stack(
            children: <Widget>[
              Image.network(urlFoto, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,

                child: Padding(
                  padding: EdgeInsets.only(top:0 , bottom: 14, left: 9, right: 0),
                  child: Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.all(Radius.circular(14))),
                    child: Center(
                        child: Text(
                      "${indexFoto + 1}",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16 ),
                    )),
                  ),
                ),
              ),
              Positioned(
                top: 0.0,
                left: 0.0,
                  child:  IconButton(
                      onPressed: () => onExcluirFoto(urlFoto),
                      icon: DSIconFilledSecondarySmall(iconName: 'delete'),
                    ),


              ),

            ],
          )),
    );
  }
}

class PlayerFotosAdicionar extends StatelessWidget {
  final VoidCallback onAdicionarFoto;

  const PlayerFotosAdicionar({
    super.key,
    required this.onAdicionarFoto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DSTextTitleBoldSecondary(text: 'ADICIONE UMA FOTO',),
                ],
              ),
            ],
          ),
          Center(
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: IconButton(
                        onPressed: () => onAdicionarFoto,
                        icon: const DSIconFilledSecondaryLarge(iconName: 'plus'),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
