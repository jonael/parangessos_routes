class Article {
    String articleImageUrl1;
    String articleImageUrl2;
    String articleImageUrl3;
    String articleImageUrl4;
    String articleText1;
    String articleText2;
    String articleText3;
    String articleText4;
    String articleTitle;
    String idArticle;
    String idUser;
    String writeThe;

    Article({required this.articleImageUrl1, required this.articleImageUrl2, required this.articleImageUrl3, required this.articleImageUrl4, required this.articleText1, required this.articleText2, required this.articleText3, required this.articleText4, required this.articleTitle, required this.idArticle, required this.idUser, required this.writeThe});

    factory Article.fromJson(Map<String, dynamic> json) {
        return Article(
            articleImageUrl1: json['articleImageUrl1'],
            articleImageUrl2: json['articleImageUrl2'],
            articleImageUrl3: json['articleImageUrl3'],
            articleImageUrl4: json['articleImageUrl4'],
            articleText1: json['articleText1'],
            articleText2: json['articleText2'],
            articleText3: json['articleText3'],
            articleText4: json['articleText4'],
            articleTitle: json['articleTitle'],
            idArticle: json['idArticle'],
            idUser: json['idUser'],
            writeThe: json['writeThe'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['articleImageUrl1'] = this.articleImageUrl1;
        data['articleImageUrl2'] = this.articleImageUrl2;
        data['articleImageUrl3'] = this.articleImageUrl3;
        data['articleImageUrl4'] = this.articleImageUrl4;
        data['articleText1'] = this.articleText1;
        data['articleText2'] = this.articleText2;
        data['articleText3'] = this.articleText3;
        data['articleText4'] = this.articleText4;
        data['articleTitle'] = this.articleTitle;
        data['idArticle'] = this.idArticle;
        data['idUser'] = this.idUser;
        data['writeThe'] = this.writeThe;
        return data;
    }
}