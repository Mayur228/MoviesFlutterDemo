import 'package:injectable/injectable.dart';
import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/homescreen/data/model/movie_list_model.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';

import '../repository/movie_repository.dart';

@injectable
class GetMovieList {

  final MovieRepository _repository;

  GetMovieList(this._repository);

  Future<Resource<List<Movie>>> call(String movieCat) async {
    return _repository.getMovieForCategory(movieCat);
  }
}
