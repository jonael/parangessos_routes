class Town {
    String idTown;
    String townCp;
    String townName;

    Town({required this.idTown, required this.townCp, required this.townName});

    factory Town.fromJson(Map<String, dynamic> json) {
        return Town(
            idTown: json['idTown'],
            townCp: json['townCp'],
            townName: json['townName'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['idTown'] = this.idTown;
        data['townCp'] = this.townCp;
        data['townName'] = this.townName;
        return data;
    }
}