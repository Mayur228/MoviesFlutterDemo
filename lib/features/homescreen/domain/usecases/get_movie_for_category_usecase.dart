import 'package:injectable/injectable.dart';
import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/repository/movie_repository.dart';

import '../entities/movies_list_entiy.dart';

@injectable
class GetMovieForCategoryUseCase {

  final MovieRepository _repository;

  GetMovieForCategoryUseCase(this._repository);

  Future<Resource<List<MovieListData>>> call(String categoryId) {
    return _repository.getMovieForCategory(categoryId);
  }
}