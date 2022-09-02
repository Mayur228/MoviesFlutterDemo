import 'package:floor/floor.dart';
import 'package:movie_flutter_demo/features/addmovie/data/datasources/entities/movies.dart';

@dao
abstract class MoviesDao {
 @Query('SELECT * FROM Movies')
  Future<List<Movies>> getAllMovies();

 @Insert()
  Future<void> addMovies(Movies movies);
}