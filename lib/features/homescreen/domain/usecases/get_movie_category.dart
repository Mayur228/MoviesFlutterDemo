import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';

class GetMovieCategory {
  // final MovieRepository repository;

  GetMovieCategory();

  List<MovieCategoryData> getData() {
    List<MovieCategoryData> movieList;

    movieList = [
      MovieCategoryData(movieCatId: 'm-1', movieCat: 'Bollywood'),
      MovieCategoryData(movieCatId: 'm-2', movieCat: 'Hollywood'),
      MovieCategoryData(movieCatId: 'm-3', movieCat: 'Tollywood'),
      MovieCategoryData(movieCatId: 'm-4', movieCat: 'Kollywood')
    ];
    return movieList;
  }
}
