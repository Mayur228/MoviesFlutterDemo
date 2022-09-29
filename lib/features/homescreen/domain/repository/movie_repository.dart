import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';

abstract class MovieRepository {
  Future<Resource<List<MovieListData>>> getMovieForCategory(String categoryId);
  Future<Resource<List<MovieCategoryData>>> getMovieCategory();
}
