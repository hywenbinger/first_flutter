class Person {
  String name;
  String avatarURL;

  Person.fromMap(Map<String, dynamic> json) {
    this.name = json["name"];
    this.avatarURL = json["avatars"]["large"];
  }

  @override
  String toString() {
    return 'Person{name: $name, avatarURL: $avatarURL}';
  }
}

class Actor extends Person {
  Actor.fromMap(Map<String, dynamic> json) : super.fromMap(json);
}

class Director extends Person {
  Director.fromMap(Map<String, dynamic> json) : super.fromMap(json);
}

int counter = 1;

class MovieModel {
  int rank;
  String imageURL;
  String title;
  String playDate;
  double rating;
  List<String> genres;
  List<Actor> casts;
  Director director;
  String originalTitle;

  MovieModel.fromMap(Map<String, dynamic> json) {
    this.rank = counter++;
    this.imageURL = json["images"]["large"];
    this.title = json["title"];
    this.playDate = json["year"].toString();
    this.rating = json["rating"]["average"];
    this.genres = json["genres"].cast<String>();
    this.casts = (json["casts"] as List<dynamic>).map((item) {
      return Actor.fromMap(item);
    }).toList();
    this.director = Director.fromMap(json["directors"][0]);
    this.originalTitle = json["original_title"];
  }

  @override
  String toString() {
    return 'MovieModel{rank: $rank, imageURL: $imageURL, title: $title, playDate: $playDate, rating: $rating, genres: $genres, casts: $casts, director: $director, originalTitle: $originalTitle}';
  }
}
