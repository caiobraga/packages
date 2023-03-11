import 'package:flutter/material.dart';

import '../widgets/orcamento/orcamento_listtile.dart';
import '../widgets/orcamento/orcamento_viewmodel.dart';

class OrcamentoListTileScreen extends StatelessWidget {
  const OrcamentoListTileScreen({Key? key}) : super(key: key);

  List<OrcamentoViewModel> get viewModels => [
        const OrcamentoViewModel(
          icone: 'lightning-bolt',
          servico: 'Eletricista',
          status: '0 propostas',
          valor: 'R\$ 50',
          data: '1 dia',
          emDestaque: false,
        ),
        const OrcamentoViewModel(
          icone: 'lightning-bolt',
          servico: 'Eletricista',
          status: '2 propostas',
          valor: 'R\$ 150',
          data: '2 dias',
          emDestaque: true,
        ),
        const OrcamentoViewModel(
          icone: 'lightning-bolt',
          servico: 'Eletricista',
          status: 'finalizado',
          valor: 'R\$ 300',
          data: 'Hoje',
          emDestaque: false,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orcamento ListTile"),
      ),
      body: Center(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: viewModels.length,
              itemBuilder: (context, index) => OrcamentoListTileHorizontal(viewModel: viewModels[index], onTap: () => print('Tapped ${viewModels[index].servico}')),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: viewModels.length,
                itemBuilder: (context, index) => OrcamentoListTileVertical(viewModel: viewModels[index], onTap: () => print('Tapped ${viewModels[index].servico}')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
