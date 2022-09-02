import 'package:movie_flutter_demo/features/addmovie/data/datasources/entities/movies.dart';

abstract class MovieRepository {
  Future<List<Movies>> getMovies();
  Future<void> addMovies(Movies movies);
}