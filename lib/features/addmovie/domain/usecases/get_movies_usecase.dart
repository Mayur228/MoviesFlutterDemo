import 'package:movie_flutter_demo/features/addmovie/domain/repository/movie_repository.dart';
import 'package:movie_flutter_demo/features/addmovie/data/datasources/entities/movies.dart';

class GetMoviesUseCase {
  final MovieRepository repository;

  GetMoviesUseCase(this.repository);

  Future<List<Movies>> call() {
    return repository.getMovies();
  }
}