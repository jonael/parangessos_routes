class User {
    String? _idSession;
    String _pseudo = '';
    String? _mail;
    String? _photoUrl;
    String? _firstName;
    String? _name;
    String? _phone;
    int? _age;
    String? _since;
    int? _voluntary;
    int? _idTown;

    String? get idSession => _idSession;
    String get pseudo => _pseudo;
    String? get mail => _mail;
    String? get photoUrl => _photoUrl;
    String? get firstName => _firstName;
    String? get name => _name;
    String? get phone => _phone;
    int? get age => _age;
    String? get since => _since;
    int? get voluntary => _voluntary;
    int? get idTown => _idTown;

    User({
        String? idSession,
        required String pseudo,
        String? mail,
        String? photoUrl,
        String? firstName,
        String? name,
        String? phone,
        int? age,
        String? since,
        int? voluntary,
        int? idTown}){
        _idSession = idSession;
        _pseudo = this.pseudo;
        _mail = mail;
        _photoUrl = photoUrl;
        _firstName = firstName;
        _name = name;
        _phone = phone;
        _age = age;
        _since = since;
        _voluntary = voluntary;
        _idTown = idTown;
    }

    User.fromJson(dynamic json) {
        _idSession = json["idSession"];
        _pseudo = json["pseudo"];
        _mail = json["mail"];
        _photoUrl = json["photoUrl"];
        _firstName = json["firstName"];
        _name = json["name"];
        _phone = json["phone"];
        _age = json["age"];
        _since = json["since"];
        _voluntary = json["voluntary"];
        _idTown = json["idTown"];
    }

    Map<String, dynamic> toJson() {
        var map = <String, dynamic>{};
        map["idSession"] = _idSession;
        map["pseudo"] = _pseudo;
        map["mail"] = _mail;
        map["photoUrl"] = _photoUrl;
        map["firstName"] = _firstName;
        map["name"] = _name;
        map["phone"] = _phone;
        map["age"] = _age;
        map["since"] = _since;
        map["voluntary"] = _voluntary;
        map["idTown"] = _idTown;
        return map;
    }

}