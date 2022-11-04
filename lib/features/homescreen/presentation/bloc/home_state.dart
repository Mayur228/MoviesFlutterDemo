import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';

import '../../data/model/movie_list_model.dart';
import '../vo/movie_vo.dart';

abstract class HomeState {
}

class Pending extends HomeState {

}

class ErrorState extends HomeState{

}

class LoadedState extends HomeState {

  final List<MovieCategoryData> categories;
  // final Resource<List<Movie>> movies;
 final Resource<MovieVo> movieVo;

  LoadedState({required this.categories, required this.movieVo,});
}

class RedirectToDetailsState extends HomeState {
  final String movieId;
  final bool isLike;

  RedirectToDetailsState(this.movieId,this.isLike);
}