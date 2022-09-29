import 'package:injectable/injectable.dart';
import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/repository/movie_repository.dart';


@injectable
class GetMovieCategory {
  final MovieRepository repository;

  GetMovieCategory(this.repository);

  Future<Resource<List<MovieCategoryData>>> call() async {

    await Future.delayed(Duration(seconds: 5));

    return repository.getMovieCategory();
  }
}
