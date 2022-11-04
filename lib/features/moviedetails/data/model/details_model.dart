class MovieDetails {
  String? id;
  String? name;
  String? poster;
  double? rating;
  String? director;
  String? description;

  MovieDetails({this.id, this.name, this.poster, this.rating, this.director, this.description});

  MovieDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    poster = json['poster'];
    rating = json['rating'];
    director = json['director'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['poster'] = poster;
    data['rating'] = rating;
    data['director'] = director;
    data['description'] = description;
    return data;
  }
}