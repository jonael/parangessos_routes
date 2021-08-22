class AnswerPost {
    String answerText;
    String idAnswer;
    String idPost;
    String idUser;
    String writeThe;

    AnswerPost({required this.answerText, required this.idAnswer, required this.idPost, required this.idUser, required this.writeThe});

    factory AnswerPost.fromJson(Map<String, dynamic> json) {
        return AnswerPost(
            answerText: json['answerText'],
            idAnswer: json['idAnswer'],
            idPost: json['idPost'],
            idUser: json['idUser'],
            writeThe: json['writeThe'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['answerText'] = this.answerText;
        data['idAnswer'] = this.idAnswer;
        data['idPost'] = this.idPost;
        data['idUser'] = this.idUser;
        data['writeThe'] = this.writeThe;
        return data;
    }
}