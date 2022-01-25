class PostModel {
  String? user;
  String? post;
  String? date;
  String? hashtag;
  String? imagePost;

  // *constructor
  PostModel({
    required this.user,
    required this.post,
    required this.date,
    this.hashtag,
    this.imagePost,
  });

  // *toJson
  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'post': post,
      'date': date,
      'hashtag': hashtag,
      'imagePost': imagePost,
    };
  }
}
