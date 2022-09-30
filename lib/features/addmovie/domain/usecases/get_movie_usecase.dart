import 'package:movie_flutter_demo/features/addmovie/data/datasources/entities/movies.dart';
import 'package:movie_flutter_demo/features/addmovie/domain/repository/movie_repository.dart';

class GetMovieUseCase {
  final MovieRepository repository;

  GetMovieUseCase(this.repository);

  Future<List<Movies>> call() {
    return repository.getMovies();
  }
}