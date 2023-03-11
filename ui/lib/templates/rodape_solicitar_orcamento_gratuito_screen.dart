import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import '../widgets/footer/orcamento_gratuito/orcamento_gratuito_footer.dart';
import '../widgets/footer/orcamento_gratuito/orcamento_gratuito_viewmodel.dart';
import '../widgets/footer/solicitar_orcamento/solicitar_orcamento_footer.dart';
import '../widgets/footer/solicitar_orcamento/solicitar_orcamento_viewmodel.dart';

class RodapeSolicitarOrcamentoGratuitoScreen extends StatefulWidget {
  const RodapeSolicitarOrcamentoGratuitoScreen({Key? key}) : super(key: key);

  @override
  State<RodapeSolicitarOrcamentoGratuitoScreen> createState() => _RodapeSolicitarOrcamentoGratuitoScreenState();
}

class _RodapeSolicitarOrcamentoGratuitoScreenState extends State<RodapeSolicitarOrcamentoGratuitoScreen> {
  SolidController _controller = SolidController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rodape Solicitar Orcamento"),
      ),
      bottomSheet: OrcamentoGratuitoFooter(
        viewModel: const OrcamentoGratuitoFooterViewModel(
          preco_medio: "R\$ 100 - R\$ 622",
          nota: "4.5",
        ),
        onClickSolicitarOrcamento: () {},
      ),
    );
  }
}
