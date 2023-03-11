import 'package:flutter/material.dart';
import 'package:zeder/design_system/design_system.dart';
import 'package:zeder/ui/widgets/footer/solicitar_orcamento/solicitar_orcamento_viewmodel.dart';

import '../../../../design_system/widgets/footer.dart';
import '../../../../design_system/widgets/text.dart';
import '../../../../domain/domain.dart';
import '../../botoes.dart';
import 'confirmar_proposta_viewmodel.dart';

class ConfirmarPropostaFooter extends  StatelessWidget {
  
  final ConfirmarPropostaFooterViewModel viewModel;

  final void Function()? SelectCardRadioButtonSecondaryAction;

  final VoidCallback onClickConfirmarProsta;

  final void Function(PaymentTypeEntity?)? onSelectCardRadioButton;
  final void Function(PaymentTypeEntity?)? onSelectPixRadioButton;

  final PaymentTypeEntity selectedType;

  const ConfirmarPropostaFooter({
    Key? key,
    required this.viewModel,
    required this.SelectCardRadioButtonSecondaryAction,
    required this.onClickConfirmarProsta,
    required this.onSelectCardRadioButton,
    required this.onSelectPixRadioButton,
    required this.selectedType,
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
        children: [title, selecionarFormaPagamento, divider, botao],
      );

  Widget? get body => null;

  Widget get title =>  Padding(
        padding:  EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DSTextTitleBoldSecondary(text: "Escolha uma forma de pagameneto"),
                 DSTextSubtitleSecondary(text: "Parcelamento em até 12x"),
              ],
            ),
          ],
        ),
      );



  Widget get selecionarFormaPagamento => Padding(padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Column(children: [
              RadioButton(title: "Cartão", groupValue: selectedType.type, 
              secondary: ButtonLink(onPressed: SelectCardRadioButtonSecondaryAction, text: viewModel.selectCardRadioButtonTextSecondary,),
              subtitle: viewModel.selectCardRadioButtonSubtitle,
              onChanged: (Object? value) {
                if(value.runtimeType == PaymentTypeEntity) {
                  onSelectCardRadioButton!(value as PaymentTypeEntity);
                }
                else {
                  onSelectCardRadioButton!(null);
                }
              },
              value: PaymentTypeEntity.card().type,
              ),
            RadioButton(title: "Pix", groupValue: selectedType.type, 
            onChanged: (Object? value) {
              if(value.runtimeType == PaymentTypeEntity) {
                onSelectPixRadioButton!(value as PaymentTypeEntity);
              }
              else {
                onSelectPixRadioButton!(null);
              }
            }, 
            value: PaymentTypeEntity.pix().type,),
            ],),
        ],
      ),
    ],
  )
  );

  Widget get botao => Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: BotaoPadraoGrande(texto: "Confirmar Proposta", onPressed: onClickConfirmarProsta),
      );

  Widget get divider => const Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
        child: Material(child: Divider()),
      );
}
