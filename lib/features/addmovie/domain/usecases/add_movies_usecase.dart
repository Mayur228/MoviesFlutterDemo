import 'package:injectable/injectable.dart';
import 'package:movie_flutter_demo/features/addmovie/domain/repository/movie_repository.dart';
import 'package:movie_flutter_demo/features/addmovie/data/datasources/entities/movies.dart';

class AddMoviesUseCase {
  final MovieRepository repository;

  AddMoviesUseCase(this.repository);

  Future<void> call(Movies movies) {
    return repository.addMovies(movies);
  }
}