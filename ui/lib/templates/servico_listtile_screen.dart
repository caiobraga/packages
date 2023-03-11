import 'package:flutter/material.dart';

import '../widgets/servico/servico_listtile.dart';
import '../widgets/servico/servico_viewmodel.dart';

class ServicoListTileScreen extends StatelessWidget {
  const ServicoListTileScreen({Key? key}) : super(key: key);

  List<ServicoViewModel> get viewModels => [
        const ServicoViewModel(
          icone: 'lightning-bolt',
          servico: 'Eletricista',
          status: 'Aguardando Resposta',
          valor: 'R\$ 50',
          data: '1 dia',
          emDestaque: false,
        ),
        const ServicoViewModel(
          icone: 'lightning-bolt',
          servico: 'Eletricista',
          status: 'Proposta Aceita',
          valor: 'R\$ 150',
          data: '2 dias',
          emDestaque: true,
        ),
        const ServicoViewModel(
          icone: 'lightning-bolt',
          servico: 'Eletricista',
          status: 'Finalizado',
          valor: 'R\$ 300',
          data: 'Hoje',
          emDestaque: false,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Servico ListTile"),
      ),
      body: Center(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: viewModels.length,
              itemBuilder: (context, index) => ServicoListTileHorizontal(viewModel: viewModels[index], onTap: () => print('Tapped ${viewModels[index].servico}')),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: viewModels.length,
                itemBuilder: (context, index) => ServicoListTileVertical(viewModel: viewModels[index], onTap: () => print('Tapped ${viewModels[index].servico}')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
