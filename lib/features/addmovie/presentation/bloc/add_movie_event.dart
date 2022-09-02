import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';

class AddMovieEvent {

}

class SetDropDownCategoryDataEvent extends AddMovieEvent {
  final List<MovieCategoryData> category;

  SetDropDownCategoryDataEvent(this.category);

}