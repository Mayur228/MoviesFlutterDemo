import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';

abstract class HomeState {
}

class Pending extends HomeState {

}

class ErrorState extends HomeState{

}

class LoadedState extends HomeState {

  final List<MovieCategoryData> categories;
  final Resource<List<MovieListData>> movies;

  LoadedState({required this.categories, required this.movies,});
}