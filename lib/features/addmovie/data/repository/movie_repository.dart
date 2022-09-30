import 'package:injectable/injectable.dart';
import 'package:movie_flutter_demo/features/addmovie/data/datasources/local/app_databse.dart';
import 'package:movie_flutter_demo/features/addmovie/data/datasources/entities/movies.dart';
import 'package:movie_flutter_demo/features/addmovie/domain/repository/movie_repository.dart';

@Injectable(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  // final AppDatabase appDatabase;

  MovieRepositoryImpl();

  @override
  Future<void> addMovies(Movies movies) async {
    final database = await getDatabase();
    return database.moviesDao.addMovies(movies);
  }

  @override
  Future<List<Movies>> getMovies() async {
    final database = await getDatabase();
    return database.moviesDao.getAllMovies();
  }

  Future<AppDatabase> getDatabase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('movieDatabase.db').build();
    return database;
  }
}
