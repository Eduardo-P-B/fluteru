class Post {
  int userId = 0;
  int id = 0;
  String title = '';
  String body = '';

  Post();

  //constructor para criar um objeto Post a partir de um mapa JSON
  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}