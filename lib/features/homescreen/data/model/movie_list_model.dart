import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';

/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Movie {
  String? id;
  String? name;
  String? poster;
  double? rating;
  String? director;
  String? description;

  Movie({this.id, this.name, this.poster, this.rating, this.director, this.description});

  Movie.fromJson(Map<String, dynamic> json) {
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

class MovieListDataModel {
  List<Movie?>? movies;

  MovieListDataModel({this.movies});

  MovieListDataModel.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = <Movie>[];
      json['movies'].forEach((v) {
        movies!.add(Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['movies'] =movies != null ? movies!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}


