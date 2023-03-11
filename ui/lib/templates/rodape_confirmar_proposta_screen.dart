import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:zeder/domain/domain.dart';
import 'package:zeder/ui/widgets/footer/confirmar_proposta/confirmar_proposta_viewmodel.dart';

import '../widgets/footer/confirmar_proposta/confirmar_proposta_footer.dart';
import '../widgets/footer/orcamento_gratuito/orcamento_gratuito_footer.dart';
import '../widgets/footer/orcamento_gratuito/orcamento_gratuito_viewmodel.dart';
import '../widgets/footer/solicitar_orcamento/solicitar_orcamento_footer.dart';
import '../widgets/footer/solicitar_orcamento/solicitar_orcamento_viewmodel.dart';

class RodapeConfirmarPropostaScreen extends StatefulWidget {
  const RodapeConfirmarPropostaScreen({Key? key}) : super(key: key);

  @override
  State<RodapeConfirmarPropostaScreen> createState() => _RodapeConfirmarPropostaScreenState();
}

class _RodapeConfirmarPropostaScreenState extends State<RodapeConfirmarPropostaScreen> {
  SolidController _controller = SolidController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rodape Confirmar Proposta"),
      ),
      bottomSheet: ConfirmarPropostaFooter(
        SelectCardRadioButtonSecondaryAction: () {
          print("SelectCardRadioButtonSecondaryAction");
        },
        onClickConfirmarProsta: () {
          print("onClickConfirmarProsta");
        },
        onSelectCardRadioButton: (p0) {
          print("onSelectCardRadioButton");
        },
        onSelectPixRadioButton: (p0) {
          print("onSelectPixRadioButton");
        },
        selectedType: PaymentTypeEntity.card(),
        viewModel: ConfirmarPropostaFooterViewModel(selectCardRadioButtonTextSecondary: 'Escolha um novo cartão' , selectCardRadioButtonSubtitle: 'Cartão com final 000'),
        )
        
    );
  }
}
