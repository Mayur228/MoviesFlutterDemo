import 'package:equatable/equatable.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_list_entiy.dart';

abstract class HomeEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadInitialDataEvent extends HomeEvents {

}

class GetCategory extends HomeEvents {
  final List<MovieCategoryData> movieCat;

  GetCategory(this.movieCat);

  @override
  List<Object> get props => [movieCat];
}

class GetMovies extends HomeEvents {
  final List<MovieListData> movieData;

  GetMovies(this.movieData);

  @override
  List<Object> get props => [movieData];
}

class GetMoviesForCategoryEvent extends HomeEvents {
  final String catName;

  GetMoviesForCategoryEvent(this.catName);
}

