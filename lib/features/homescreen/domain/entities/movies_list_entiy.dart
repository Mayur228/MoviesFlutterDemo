import 'package:equatable/equatable.dart';

class MovieListData {
  final String movieId;
  final String movieName;
  final String movieDes;
  final String movieCat;
  final String moviePoster;
  final double movieRating;

  const MovieListData(
    this.movieId,
    this.movieName,
    this.movieDes,
    this.movieCat,
    this.moviePoster,
    this.movieRating,
  );
}
