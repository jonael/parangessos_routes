class Post {
    String idCategorie;
    String idPost;
    String idUser;
    String postDate;
    String postText;
    String postTitle;

    Post({required this.idCategorie, required this.idPost, required this.idUser, required this.postDate, required this.postText, required this.postTitle});

    factory Post.fromJson(Map<String, dynamic> json) {
        return Post(
            idCategorie: json['idCategorie'],
            idPost: json['idPost'],
            idUser: json['idUser'],
            postDate: json['postDate'],
            postText: json['postText'],
            postTitle: json['postTitle'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['idCategorie'] = this.idCategorie;
        data['idPost'] = this.idPost;
        data['idUser'] = this.idUser;
        data['postDate'] = this.postDate;
        data['postText'] = this.postText;
        data['postTitle'] = this.postTitle;
        return data;
    }
}