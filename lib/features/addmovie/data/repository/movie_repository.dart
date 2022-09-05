import 'package:movie_flutter_demo/features/addmovie/data/datasources/local/app_databse.dart';
import 'package:movie_flutter_demo/features/addmovie/data/datasources/entities/movies.dart';
import 'package:movie_flutter_demo/features/addmovie/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final AppDatabase appDatabase;

  MovieRepositoryImpl(this.appDatabase);

  @override
  Future<void> addMovies(Movies movies) {
    return appDatabase.moviesDao.addMovies(movies);
  }

  @override
  Future<List<Movies>> getMovies() {
    return appDatabase.moviesDao.getAllMovies();
  }
}