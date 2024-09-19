class Client {
  int? id;
  String nom;
  String telephone;
  String adresse;

  Client({
    this.id,
    required this.nom,
    required this.telephone,
    required this.adresse,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      nom: json['nom'],
      telephone: json['telephone'],
      adresse: json['adresse'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'telephone': telephone,
      'adresse': adresse,
    };
  }
}
