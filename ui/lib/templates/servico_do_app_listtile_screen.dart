import 'package:flutter/material.dart';

import '../widgets/servico_do_app/servico_do_app_listtile.dart';
import '../widgets/servico_do_app/servico_do_app_viewmodel.dart';

class ServicoDoAppListTileScreen extends StatelessWidget {
  const ServicoDoAppListTileScreen({Key? key}) : super(key: key);

  List<ServicoDoAppViewModel> get viewModels => [
        const ServicoDoAppViewModel(
          icone: 'lightning-bolt',
          servico: 'Eletricista',
          valor: 'R\$ 100',
          nota: '4.5',
          qtdeAvaliacoes: '(1.530)',
        ),
        const ServicoDoAppViewModel(
          icone: 'lightning-bolt',
          servico: 'Babá',
          valor: 'R\$ 100',
          nota: '4.1',
          qtdeAvaliacoes: '(2.530)',
        ),
        const ServicoDoAppViewModel(
          icone: 'lightning-bolt',
          servico: 'Motorista',
          valor: 'R\$ 50',
          nota: '4.4',
          qtdeAvaliacoes: '(28)',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Servico do App ListTile"),
      ),
      body: Center(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: viewModels.length,
              itemBuilder: (context, index) => ServicoDoAppListTile(viewModel: viewModels[index], onTap: () => print('Tapped ${viewModels[index].servico}')),
            ),
          ],
        ),
      ),
    );
  }
}
