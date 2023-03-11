import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';

import '../widgets/botoes.dart';

class BotoesScreen extends StatefulWidget {
  const BotoesScreen({Key? key}) : super(key: key);

  @override
  _BotoesScreenState createState() => _BotoesScreenState();
}

class _BotoesScreenState extends State<BotoesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Botão Padrão"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BotaoPadraoGrande(texto: "FAZER ORÇAMENTO", onPressed: () => print("FAZER ORÇAMENTO")),
            const SizedBox(height: 20),
            BotaoSecundarioGrande(texto: "VOLTAR", onPressed: () => print("VOLTAR")),
            const SizedBox(height: 20),
            ButtonLink(onPressed: ()=> print("Escolher novo cartão"), text: "Escolher novo cartão",),
            const SizedBox(height: 20,),
            Column(children: [
              RadioButton(title: "Cartão", groupValue: "Cartão", 
              secondary: ButtonLink(onPressed: ()=> print("Escolher novo cartão"), text: "Escolher novo cartão",),
              subtitle: 'Cartão com final 000' ,
              onChanged: (Object? value ) { 
              setState((){});
            }, value: "Cartão",),
            RadioButton(title: "teste2", groupValue: "teste", 
            onChanged: (Object? value ) { 
              setState((){});
            }, value: "teste2",),
            ],),
            
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(16),
              child: BarraBotoesPadraoPequeno(
                textoBotaoPadrao: "ACEITAR",
                onPressedBotaoPadrao: () => print("ACEITAR"),
                textoBotaoSecundario: "RECUSAR",
                onPressedBotaoSecundario: () => print("RECUSAR"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
