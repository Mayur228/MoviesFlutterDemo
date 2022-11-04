import 'package:injectable/injectable.dart';
import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/moviedetails/domain/entities/details_entity.dart';
import 'package:movie_flutter_demo/features/moviedetails/domain/repository/details_repository.dart';

@injectable
class GetMovieDetailsUseCase {
  final MovieDetailsRepository repository;

  GetMovieDetailsUseCase(this.repository);

  Future<Resource<DetailsEntity>> call(String movieId) async {
    return repository.getMovieDetails(movieId);
  }

}