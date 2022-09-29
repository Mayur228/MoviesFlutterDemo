import 'package:injectable/injectable.dart';
import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';

import '../repository/movie_repository.dart';

@injectable
class GetMovieList {

  final MovieRepository _repository;

  GetMovieList(this._repository);

  Future<Resource<List<MovieListData>>> call(String movieCat) async {
    return _repository.getMovieForCategory(movieCat);
  }
}
