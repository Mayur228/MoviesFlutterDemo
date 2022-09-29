import 'package:equatable/equatable.dart';

class MovieListData {
  final String movieId;
  final String movieName;
  final String movieDes;
  final String movieCat;
  final String moviePoster;
  final double movieRating;

  const MovieListData({
    required this.movieId,
    required this.movieName,
    required this.movieDes,
    required this.movieCat,
    required this.moviePoster,
    required this.movieRating,
  });
}
