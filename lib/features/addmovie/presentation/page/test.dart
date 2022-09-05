import 'package:movie_flutter_demo/features/addmovie/data/datasources/local/app_databse.dart';
import 'package:movie_flutter_demo/features/addmovie/data/datasources/local/movies_dao.dart';

class AppDataBaseImpl extends AppDatabase {
  @override
  MoviesDao get moviesDao => throw UnimplementedError();

}