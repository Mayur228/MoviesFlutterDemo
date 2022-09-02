import 'package:floor/floor.dart';
import 'package:movie_flutter_demo/features/addmovie/data/datasources/local/movies_dao.dart';
import 'package:movie_flutter_demo/features/addmovie/data/datasources/entities/movies.dart';

@Database(version: 1, entities: [Movies])
abstract class AppDatabase extends FloorDatabase{
  MoviesDao get moviesDao;
}