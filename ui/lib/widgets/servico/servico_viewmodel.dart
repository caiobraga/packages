class ServicoViewModel {
  final String icone;
  final String servico;
  final String status;
  final String valor;
  final String data;
  final bool emDestaque;

  const ServicoViewModel({
    required this.icone,
    required this.servico,
    required this.status,
    required this.valor,
    required this.data,
    required this.emDestaque,
  });
}
