import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';

abstract class AddMovieState {

}

class PendingState extends AddMovieState {

}

class ErrorState extends AddMovieState {

}

class LoadedState extends AddMovieState {
 final List<MovieCategoryData> movieCategory;

  LoadedState(this.movieCategory);
}