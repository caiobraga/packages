import 'package:flutter/material.dart';
import 'package:zeder/ui/widgets/footer/solicitar_orcamento/solicitar_orcamento_viewmodel.dart';

import '../../../../design_system/widgets/footer.dart';
import '../../../../design_system/widgets/text.dart';
import '../../botoes.dart';

class SolicitarOrcamentoFooter extends StatelessWidget {
  final VoidCallback onClickSolicitarOrcamento;
  final SolicitarOrcamentoFooterViewModel viewModel;
  const SolicitarOrcamentoFooter({
    Key? key,
    required this.viewModel,
    required this.onClickSolicitarOrcamento,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Footer(
      header: header,
      body: body,
    );
  }

  Widget get header => Column(
        mainAxisSize: MainAxisSize.min,
        children: [valorData, divider, botao],
      );

  Widget? get body => null;

  Widget get valorData => Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DSTextTitleBoldSecondary(text: viewModel.valor),
                const DSTextSubtitleSecondary(text: "Valor Total do Orçamento"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DSTextTitleBoldSecondary(text: viewModel.data),
                const DSTextSubtitleSecondary(text: "Data"),
              ],
            ),
          ],
        ),
      );

  Widget get botao => Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: BotaoPadraoGrande(texto: "Soliciar Orçamento", onPressed: onClickSolicitarOrcamento),
      );

  Widget get divider => const Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
        child: Material(child: Divider()),
      );
}
