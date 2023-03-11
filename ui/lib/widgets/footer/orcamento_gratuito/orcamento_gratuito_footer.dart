import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/widgets/footer/solicitar_orcamento/solicitar_orcamento_viewmodel.dart';

import '../../../../design_system/widgets/footer.dart';
import '../../../../design_system/widgets/text.dart';
import '../../botoes.dart';
import 'orcamento_gratuito_viewmodel.dart';

class OrcamentoGratuitoFooter extends StatelessWidget {
  final VoidCallback onClickSolicitarOrcamento;
  final OrcamentoGratuitoFooterViewModel viewModel;
  const OrcamentoGratuitoFooter({
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
                DSTextTitleBoldSecondary(text: viewModel.preco_medio),
                const DSTextSubtitleSecondary(text: "Preço médio estimado"),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DSIconLargeSecondary(iconName: 'seal'),
                const SizedBox(width: 24),
                DSTextTitleBoldSecondary(text: viewModel.nota),
                
              ],
            ),
          ],
        ),
      );

  Widget get botao => Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: BotaoPadraoGrande(texto: "Peça Orçamento Gratuito", onPressed: onClickSolicitarOrcamento),
      );

  Widget get divider => const Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
        child: Material(child: Divider()),
      );
}
