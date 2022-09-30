import 'package:movie_flutter_demo/features/addmovie/data/datasources/entities/movies.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';

class AddMovieEvent {

}

class SetDropDownCategoryDataEvent extends AddMovieEvent {
  final List<MovieCategoryData> category;

  SetDropDownCategoryDataEvent(this.category);

}

class GetMoviesEvent extends AddMovieEvent {
  // final List<Movies> list;

  GetMoviesEvent();
}