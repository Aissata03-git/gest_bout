class Dette {
  final int? id;
  final double montant;
  final String date;
  final int clientId;
  final bool solde; // Propriété pour indiquer si la dette est soldée ou non

  Dette({this.id, required this.montant, required this.date, required this.clientId, required this.solde});
}
