class Categorie {
    String categorieName;
    String idCategorie;

    Categorie({required this.categorieName, required this.idCategorie});

    factory Categorie.fromJson(Map<String, dynamic> json) {
        return Categorie(
            categorieName: json['categorieName'],
            idCategorie: json['idCategorie'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['categorieName'] = this.categorieName;
        data['idCategorie'] = this.idCategorie;
        return data;
    }
}