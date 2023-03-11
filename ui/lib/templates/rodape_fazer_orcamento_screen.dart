import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import '../widgets/footer/fazer_orcamento/fazer_orcamento_footer.dart';
import '../widgets/footer/fazer_orcamento/fazer_orcamento_viewmodel.dart';
import '../widgets/footer/solicitar_orcamento/solicitar_orcamento_footer.dart';
import '../widgets/footer/solicitar_orcamento/solicitar_orcamento_viewmodel.dart';

class RodapeFazerOrcamentoScreen extends StatefulWidget {
  const RodapeFazerOrcamentoScreen({Key? key}) : super(key: key);

  @override
  State<RodapeFazerOrcamentoScreen> createState() => _RodapeFazerOrcamentoScreenState();
}

class _RodapeFazerOrcamentoScreenState extends State<RodapeFazerOrcamentoScreen> {
  SolidController _controller = SolidController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rodape fazer Orcamento"),
      ),
      bottomSheet: FazerOrcamentoFooter(
        viewModel: const FazerOrcamentoFooterViewModel(
          valor: "R\$ 100 - R\$ 600",
          data: "Amanhã",
        ),
        onClickFazerOrcamento: () {},
      ),
    );
  }
}
