import 'package:floor/floor.dart';

import 'actor.dart';
@Entity(tableName: "Movies")
class Movies {
  @PrimaryKey(autoGenerate: false)
  final String movieID;
  final String title;
  final String description;
  final String category;
  final String poster;
  // final List<Actor> actors;
  final double rating;

  Movies(this.movieID, this.title, this.description, this.category, this.poster, this.rating);
}